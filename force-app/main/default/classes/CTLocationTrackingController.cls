public with sharing class CTLocationTrackingController {


    public static List<Location_Tracing__c> getVisitors(String locationId){


        return [SELECT Id, Name, Person__c, Location__c, Visit_Date__c,Person__r.Token__c,Person__r.Health_Status__c FROM Location_Tracing__c WHERE Id =:locationId ORDER BY Visit_Date__c DESC];



    }


    public static List<Location_Tracing__c> getLocationsByPersonIds(Set<Id> personIds){

            return [SELECT Id, Name, Person__c, Location__c FROM Location_Tracing__c WHERE Location__r.Id IN :personIds AND Visit_Date__c = LAST_N_DAYS:10 ORDER BY Visit_Date__c DESC];

    }

    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){

            return [SELECT Id, Name, Person__c, Location__c FROM Location_Tracing__c WHERE Location__r.Id IN :locationIds AND Person__r.Health_Status__c ='Green' AND Visit_Date__c = LAST_N_DAYS:10 ORDER BY Visit_Date__c DESC];


    }
}
