using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

[assembly: CLSCompliant(true)]
namespace CrashHandler
{
	static class Program
	{
		static Dictionary<string, Action<string[]>> _functions = new Dictionary<string, Action<string[]>>()
		{
			{"crash", ShowCrashReport }
		};

		private static void ShowCrashReport(string[] obj)
		{
			CrashDumper dmper = null;
			try
			{
				dmper = new CrashDumper(obj[0]);
				frmCrashReporter reporter = new frmCrashReporter(dmper);

				Application.Run(reporter);

				if (reporter.DialogResult == DialogResult.OK)
				{
					Application.Run(new frmNoMoreUserInput(dmper));
				}
			}
			finally 
			{
				//Last ditch attempt at closing chummer if not done yet
				try
				{
					dmper?.Process?.Kill();
				} catch { }
			}
		}

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main(string[] args)
		{ 
            for (int i = 0; i < args.Length - 1; ++i)
            {
                if (_functions.TryGetValue(args[i], out Action<string[]> actCachedAction))
                {
                    actCachedAction(args.Skip(i + 1).ToArray());
                    break;
                }
            }

            //Application.EnableVisualStyles();
            //Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new frmCrashReporter());
        }
	}
}
