-- Storage Example
pver="1.0" -- Example Ver
mver="0.2.1" -- Mod Ver this works with

--Container = "Small" -- Name of the container (Only uncomment one)
Container = "Large" 

ConChk = 0

Item_Storage = component.proxy(component.findComponent(Container)[1])

function Get_ItemName (Slot)
Item_Invent  = Item_Storage:getInventories()[1]
Item_Stack = Item_Invent:getStack(Slot)
Item_Name = Item_Stack.item.type.name
return Item_Name
end

function Get_TotalStored()
Item_Invent  = Item_Storage:getInventories()[1]
Item_Count = Item_Invent.itemCount
return Item_Count
end

function Get_ConSize()
Item_Invent  = Item_Storage:getInventories()[1]
Cont_Size = Item_Invent.size
return Cont_Size
end

function Get_StackSize(Slot)
Item_Invent  = Item_Storage:getInventories()[1]
Item_Stack = Item_Invent:getStack(Slot)
Item_StackSize = Item_Stack.count
return Item_StackSize
end

function Con_Flush()
Item_Invent  = Item_Storage:getInventories()[1]
Item_Invent:flush()
end

function Con_Sort()
Item_Invent  = Item_Storage:getInventories()[1]
Item_Invent:sort()
end

function Get_ConTotal(Slot)
Item_Invent  = Item_Storage:getInventories()[1]
Item_Stack = Item_Invent:getStack(Slot)
Cont_Size = Item_Invent.size
Item_StackSize = Item_Stack.count
ConTotal = Cont_Size * Item_StackSize
return ConTotal
end

print("Container Example pv"..pver.." mv"..mver)
print("The below displayed is in order of the Container functions")
print("")

print("Item Name       : "..Get_ItemName(0))-- Item Name in slot 0
print("Total Number    : "..Get_TotalStored()) -- Number of items in the container
print("Container Slots : "..Get_ConSize()) -- container slots
print("Item Stack Size : "..Get_StackSize(0)) -- What the Item stacks in
print("Container Cap   : "..Get_ConTotal(0)) -- Total Capacity for container.
--Con_Flush() -- Flushes the container 
--Con_Sort() -- Sorts the container