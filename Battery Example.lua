--Battery Example
pver="1.2" -- Example Ver
mver="0.2.1" -- Mod Ver this works with

Name= "Battery" -- Name of the battery (default is "Battery")

--## Start of program ##
function round(x) -- Used to round up for the outputs otherwise they would be 0.00415464898494948. Thanks to RaidenR for compact ver
  return math.floor(x + 0.5)
end

--Battery Connection
battery = component.proxy(component.findComponent(Name)[1])
-- Battery Functions
Stored     = battery.powerStore -- Shows Stored Percentage
StoredPer  = battery.powerStorePercent -- shows something else don't know what
TimeFull   = battery.timeUntilFull -- Time till full in Secs
TimeEmpty  = battery.timeUntilEmpty -- Time till Empty In Secs
Incoming   = battery.powerIn -- Shows the power coming in for charging
Outgoing   = battery.powerOut -- Shows the power going out
Capacity   = battery.powerCapacity -- Shows Battery Capacity
Status     = battery.batteryStatus -- Shows the state the battery is in values 0 - 4 (see below for what the output number means)
MaxIndLvl  = battery.batteryMaxIndicatorLevel -- Battery Max Indicator Level

function Bat_Status(data)
 if Status == 0 then 
  return "Idle      "
   elseif Status == 1 then 
    return"Idle Empty"
     elseif Status == 2 then 
      return"Idle Full "
      elseif Status == 3 then 
     return"Power In  "
    elseif Status == 4 then 
   return"Power Out "
  else 
 return"Unknown Status" -- in case there is an update to the status this will shown that it does not know what it is.
end
end
-- ## end of program ##


-- Example data outputs to Print
print("Battery Example pv"..pver.." mv"..mver)
print("The below displayed is in order of the Battery functions")
print("")
print("Stored             : "..round(Stored).."%")
--print(round(StoredPer)) -- Dont know what this one is thought this would be % stored but it's not
print("Time Full          : "..round(TimeFull))
print("Time Empty         : "..round(TimeEmpty))
print("Power In           : "..round(Incoming))
print("Power Out          : "..round(Outgoing))
print("Power Capacity     : "..Capacity)
print("Max Indicator Lvl  : "..MaxIndLvl)
print("Raw Status Data    : "..Status) -- Below is the different states this has
print("Stat Data Processed: "..Bat_Status(data))
