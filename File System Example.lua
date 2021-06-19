-- File System Example
pver="1.0" -- Example Ver
mver="0.2.1" -- Mod Ver this works with


Log = "SysLog.lua" -- File Name
Drive = "C7ABB0EB495CA0C4B2E3319CD8AE6CF6" -- Drive

DataLog = {"Done1","Done2","Done3","Done4","Done5","0","0","true","false","true","Error","Error","Error","0","1","2500","15","78"}


function Sys_FSWrite(FileName, Drive, Contents) -- Writes a single line to file
fs = filesystem
print("Intalizing Drive...")
fs.initFileSystem("/dev")
print("Mounting Drive...")
fs.mount("/dev/"..Drive.."", "/")
print("Opening File...")
local file = fs.open("/"..FileName.."", "w")
print("Writing to file... [PLEASE DO NOT TURN OFF THE COMPUTER]")
file:write(Contents)--,"\n")
print("Closing File...")
file:close()
print("File Created : "..FileName)
end

function Sys_FSWriteLog(FileName, Drive, Contents, Line) -- Writes a multiple lines to file for loging.
fs = filesystem
print("Intalizing Drive...")
fs.initFileSystem("/dev")
print("Mounting Drive...")
fs.mount("/dev/"..Drive.."", "/")
print("Opening File...")
local file = fs.open("/"..FileName.."", "w")
print("Writing to file... [PLEASE DO NOT TURN OFF THE COMPUTER]")
for x = 1, Line do
file:write(Contents[x],"\n")
end
file:write("End Of Log")--,"\n")
print("Closing File...")
file:close()
print("File Created : "..FileName)
end


function Sys_FSRead(FileName, Drive)
fs = filesystem
fs.initFileSystem("/dev")
fs.mount("/dev/"..Drive.."", "/")
local file = fs.open("/"..FileName.."", "r")
print(file)
file:close()
end

function Sys_FSClose(FileName, Drive)
local file = fs.open("/"..FileName.."", "w")
file:close()
end

function Sys_FSBoot(FileName, Drive)
event.ignoreAll()
event.clear()

fs = filesystem

function Sys_FSBootInternalFunctionA(x) 
drive = ""
for _,f in pairs(filesystem.childs("/dev")) do
 if not (f == "serial") then
  drive = f
  break
 end
end
filesystem.mount("/dev/" .. drive, "/")
filesystem.doFile(x)
end


if fs.initFileSystem("/dev") == false then
 print("Cannot initialize /dev")
  else
   drives = fs.childs("/dev")
  for idx, drive in pairs(drives) do
     if drive == "serial" then table.remove(drives, idx) 
    end 
end
print("Loaded From Drive: "..drives[1])
Sys_FSBootInternalFunctionA(FileName)
end
end



--Sys_FSWrite(Log, Drive, "Test")
--Sys_FSWriteLog(Log, Drive, DataLog, 18)
--Sys_FSRead(Log, Drive)
--Sys_FSBoot(Log, Drive)