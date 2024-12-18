# **Advanced Vehicle Keys for QBCore**

🚗 **An advanced vehicle key system for QBCore** that adds unique vehicle keys as items. Keys display car details like model and plate, improving immersion and server realism.



## **Features**
- 🚗 **Unique Keys**: Each key is linked to a specific vehicle.
- 🛠️ **Integration**: Works seamlessly with **qb-vehicleshop** and **qb-garage**.
- 🔑 **Item Description**: Displays vehicle details (model and plate) in the inventory.
- 🖼️ **Custom Key Icon**: Includes a vehicle key image for a polished look.
- 🔒 **Customizable Lock System**: Adds a `lock` column to the database for vehicle locking.



## **Installation**

### **Step 1: Remove Old Resource**
- Delete the default `qb-vehiclekeys` resource from your server.



### **Step 2: Add the New Resource**
- Download and add this resource to your server.
- **Important**: Do not rename it keep it `DJ-vehiclekeys`.


### **Step 3: Add Key Image**
- Copy the `vehiclekeys.png` image from the **img** folder to the following directory: qb-inventory/html/images/


### **Step 4: Add Vehicle Key Item**
Add the following code in `qb-core/shared/items.lua`:

```lua
['vehiclekey'] = { 
    name = 'vehiclekey', 
    label = 'Vehicle Key', 
    weight = 10, 
    type = 'item', 
    image = 'vehiclekeys.png', 
    unique = true, 
    useable = true, 
    shouldClose = true, 
    combinable = nil, 
    description = "This is a car key. Take good care of it. If you lose it, you probably won't be able to use your car."
},
```

### **Step 5: Modify Vehicle Shop Script**
```lua
In qb-vehicleshop/client/main.lua, comment out the temporary key trigger and add the correct server event:

RegisterNetEvent('qb-vehicleshop:client:buyShowroomVehicle', function(vehicle, plate)
    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
        local veh = NetToVeh(netId)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        --TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh)) -- Comment this line
        TriggerServerEvent('qb-vehiclekeys:server:BuyVehicle', plate, GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(veh)))) -- Add this line
    end, vehicle, Config.Shops[tempShop]["VehicleSpawn"], true)
end)
```


### **Step 6: Modify Garage Script**

In qb-garage/client/main.lua, comment out the temporary key trigger:

``` lua 
RegisterNetEvent('qb-garages:client:takeOutGarage', function(data)
    QBCore.Functions.TriggerCallback('qb-garage:server:spawnvehicle', function(netId, properties)
        local veh = NetToVeh(netId)
        QBCore.Functions.SetVehicleProperties(veh, properties)
        exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
        --TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh)) -- Comment this line
        SetVehicleEngineOn(veh, true, true)
    end, vehicle, location, true)
end)
```


### **Final Steps**
Restart your server.
Test the following:
- Vehicle keys display properly in the inventory.
- Vehicle details (model and plate) appear in the item description.
- Keys work correctly with garages and vehicle shops.

### **Dependencies**
- QBCore Framework
- MySQL / oxmysql
- LegacyFuel (optional, for fuel support)

for any issues or questions, please contact me on discord: `cstrikerdj`
