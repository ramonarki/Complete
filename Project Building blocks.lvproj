<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="14008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Antenna coordinate ECI.vi" Type="VI" URL="../Antenna coordinate ECI.vi"/>
		<Item Name="Building blocks.vi" Type="VI" URL="../Building blocks.vi"/>
		<Item Name="distance calculation.vi" Type="VI" URL="../distance calculation.vi"/>
		<Item Name="Distance elevation and azimuth calculation.vi" Type="VI" URL="../Distance elevation and azimuth calculation.vi"/>
		<Item Name="EbN0required.vi" Type="VI" URL="../EbN0required.vi"/>
		<Item Name="Elevation and azimuth.vi" Type="VI" URL="../Elevation and azimuth.vi"/>
		<Item Name="Free Space Path Loss.vi" Type="VI" URL="../Free Space Path Loss.vi"/>
		<Item Name="getTimeSinceEpoch.vi" Type="VI" URL="../../SGP4 propagator/SGP4 propagator/mathscript/getTimeSinceEpoch.vi"/>
		<Item Name="getTimeStamp.vi" Type="VI" URL="../getTimeStamp.vi"/>
		<Item Name="getYear.vi" Type="VI" URL="../getYear.vi"/>
		<Item Name="julian date.vi" Type="VI" URL="../julian date.vi"/>
		<Item Name="LinkBudget.vi" Type="VI" URL="../LinkBudget.vi"/>
		<Item Name="requiredCN0.vi" Type="VI" URL="../requiredCN0.vi"/>
		<Item Name="RequiredLinkBudget.vi" Type="VI" URL="../RequiredLinkBudget.vi"/>
		<Item Name="satrecGenerator.vi" Type="VI" URL="../../satrecGenerator.vi"/>
		<Item Name="sgp4InitLabview.vi" Type="VI" URL="../../sgp4InitLabview.vi"/>
		<Item Name="sgp4Labview.vi" Type="VI" URL="../../sgp4Labview.vi"/>
		<Item Name="tetag.vi" Type="VI" URL="../tetag.vi"/>
		<Item Name="TLEparsing.vi" Type="VI" URL="../../TLEparsing.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="NI_Matrix.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/Matrix/NI_Matrix.lvlib"/>
			</Item>
			<Item Name="CN0d.vi" Type="VI" URL="../CN0d.vi"/>
			<Item Name="CN0tot.vi" Type="VI" URL="../CN0tot.vi"/>
			<Item Name="CN0u.vi" Type="VI" URL="../CN0u.vi"/>
			<Item Name="Control 1.ctl" Type="VI" URL="../../Control 1.ctl"/>
			<Item Name="getTimeStamp.vi" Type="VI" URL="../../SGP4 propagator/SGP4 propagator/mathscript/getTimeStamp.vi"/>
			<Item Name="getYearAndDay.vi" Type="VI" URL="../getYearAndDay.vi"/>
			<Item Name="sgp4.vi" Type="VI" URL="../sgp4.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
