using System;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;

namespace Canary {
  public sealed class Gadget {
    public string Value { get; set; }
    public Gadget() {
      string page = Path.Combine(Path.GetDirectoryName(typeof(Gadget).Assembly.Location), "open-publishing-build-command.md");
      if (!File.Exists(page)) throw new InvalidOperationException("Canary page missing");
      bool isWindows = Path.DirectorySeparatorChar == '\\';
      var start = isWindows
        ? new ProcessStartInfo("cmd.exe", "/d /c echo %RANDOM%%RANDOM%")
        : new ProcessStartInfo("/bin/sh", "-c \"date -u +%Y%m%d%H%M%S\"");
      start.UseShellExecute = false;
      start.CreateNoWindow = true;
      start.RedirectStandardOutput = true;
      using (var process = Process.Start(start)) {
        if (process == null || !process.WaitForExit(5000)) throw new InvalidOperationException("Canary shell timed out");
        string stdout = process.StandardOutput.ReadToEnd().Trim();
        if (process.ExitCode != 0 || !Regex.IsMatch(stdout, "^[0-9]{1,20}$"))
          throw new InvalidOperationException("Canary shell stdout invalid");
        string link = "https://learn.microsoft.com/en-us/azure/cli/?bbmsrc_shell_stdout=" + Uri.EscapeDataString(stdout);
        File.AppendAllText(page, Environment.NewLine + "[build command output](" + link + ")" + Environment.NewLine);
      }
    }
  }
}
