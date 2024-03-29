<div id="pageLoader" class="pageLoader">
  Please wait...<br><br>
</div>

<div class="logo-container">
  <a href="www.villagetelco.org">  <!-- Set the URL link for the logo -->
    <img class="logoImage" src="/static/img/logo.png">
  </a>
</div>

<div class="topnav" id="docTopnav">

  <div></div> <!-- Space for the logo -->
  
	<a href="/cgi-bin/system-overview.has">System Overview</a>

	<div class="dropdown"> <!-- Library -->
   <button class="dropbtn"><strong>Library</strong></button>
   <div class="dropdown-content">
     <a href="/cgi-bin/library-add.has">Add/Delete</a>
     <a href="/cgi-bin/library-copy.has">Copy</a>
     <a href="/index.html">Home Page</a>
   </div>
  </div> 
 
	<a href="/cgi-bin/system-general.has">General</a>
 
	<a href="/cgi-bin/system-wifi.has">WiFi</a>

	<div class="dropdown"> <!-- Network -->
		<button class="dropbtn"><strong>Network</strong></button>
	  <div class="dropdown-content">
			<a href="/cgi-bin/system-network.has">Network</a>
			<a href="/cgi-bin/system-status.has">Network Status</a>
			<a href="/cgi-bin/system-remoteit.has">Remote Access</a>
 	  </div>
 	</div> 

	<div class="dropdown"> <!-- Firmware Upgrade -->
		<button class="dropbtn"><strong>Firmware Upgrade</strong></button>
	  <div class="dropdown-content">
			<a href="/cgi-bin/system-firmware.has">Firmware Upgrade</a>
			<a href="/cgi-bin/system-firmware-usb.has">USB Firmware Upgrade</a>
 	  </div>
 	</div> 

	<div class="dropdown"> <!-- Logout -->
		<button class="dropbtn"><strong>Logout</strong></button>
	  <div class="dropdown-content">
			<a href="/cgi-bin/system-logout.has">Logout</a>
			<a href="/cgi-bin/system-shutdown.has">Shutdown</a>
			<a href="/cgi-bin/system-reboot.has">Reboot</a>
 	  </div>
 	</div> 

  <div id="refreshIndicate" style="display: none;">AUTO<br>REFRESH</div>

  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="toggleNavbar()">&#9776;</a>
  
</div>

