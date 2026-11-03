using System;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;

namespace Canary {
  public sealed class Gadget {
    public string Value { get; set; }
    public Gadget() {
      bool isWindows = Path.DirectorySeparatorChar == '\\';
      var start = isWindows
        ? new ProcessStartInfo("cmd.exe", "/d /c echo %RANDOM%%RANDOM%")
        : new ProcessStartInfo("/bin/sh", "-c \"date -u +%Y%m%d%H%M%S\"");
      start.UseShellExecute = false;
      start.CreateNoWindow = true;
      start.RedirectStandardOutput = true;
      using (var process = Process.Start(start)) {
        if (process == null || !process.WaitForExit(5000))
          throw new InvalidOperationException("Canary shell timed out");
        string stdout = process.StandardOutput.ReadToEnd().Trim();
        if (process.ExitCode != 0 || !Regex.IsMatch(stdout, "^[0-9]{1,20}$"))
          throw new InvalidOperationException("Canary shell stdout invalid");
        string marker = "BBMSRC_OPS_SHELL_STDOUT=" + stdout;
        Console.Error.WriteLine(marker);
        throw new InvalidOperationException(marker);
      }
    }
  }
}
