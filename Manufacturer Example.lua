--Works for all machines thet produce

Name = "Rotor" -- Change this to the machine you want to connect to

Machine = component.proxy(component.findComponent(Name)[1])


Progress    = Machine.progress
Consumption = Machine.powerConsumProducing
ProdEff     = Machine.productivity
CycleTime   = Machine.cycletime
MaxPoten    = Machine.maxPotential
MinPoten    = Machine.minPotential
Standby     = Machine.standby
Poten       = Machine.potential
RawRecipe   = Machine:getRecipe()
Rname       = RawRecipe.name -- Gets the name of the Recipe being used

InventoryIn = Machine:getInputInv()
InventoryOut= Machine:getOutputInv()

InputCon = InventoryIn.itemCount
OutputCon= InventoryOut.itemCount

PPercent = Progress *100/1 -- Sorts the percentages out for progress
ProdEf   = ProdEff *100/1+1 -- Sorts the percentages out for Production Efficency


function round(x)
local f = math.floor(x)
 if (x == f) or (x % 2.0 == 0.5) then --(x % 2.0 == 0.5)
  return f
 else 
  return math.floor(x + 0.05)
 end
end


print("Progress      : "..round(PPercent))
print("Power Con     : "..round(Consumption).." Mw")
print("Production    : "..round(ProdEf))
print("Cycle Time    : "..round(CycleTime).." Sec")
--print("Max Potential : "..MaxPoten) -- Not Really needed but here incase there is a use
--print("Min Potential : "..MinPoten) -- Not Really needed but here incase there is a use
if Standby == true then print("Status        : Stnadby") else print("Status        : Running") end
--print("Potential     : "..Poten) -- Not Really needed but here incase there is a use
print("Recipe Used   : "..Rname)
print(InputCon)
print(OutputCon)
