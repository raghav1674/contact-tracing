public with sharing class CTLocationController {
    

    // return Recent location 
    public static List<Location__c> getRecentStatusChanges(){

        return [SELECT  Id,Name,Status__c, Status_Update_Date__c, Red_Score__c, Pincode__c, Address__c FROM Location__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];

    }

    // search locations 
    public static List<Location__c> searchLocations(String searchTerm){

        searchTerm = '%'+searchTerm+'%';
        return [SELECT  Id,Name,Status__c, Status_Update_Date__c, Red_Score__c, Pincode__c, Address__c FROM Location__c WHERE Name LIKE :searchTerm OR Pincode__c LIKE  :searchTerm OR Address__c LIKE:searchTerm ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
    }


    // get location by id 
    public static Location__c getLocationById(String locationId){

        List<Location__c> locations = [SELECT  Id,Name,Status__c, Status_Update_Date__c, Red_Score__c, Pincode__c, Address__c FROM Location__c WHERE Id =:locationId];

        if(locations !=null && locations.size() > 0)
            return locations.get(0);
        return null;
    }

}
