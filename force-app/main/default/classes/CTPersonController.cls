public with sharing class CTPersonController {

    public static String getToken(String mobile){

        Blob data=  Blob.valueOf(mobile);
        Blob hash = Crypto.generateDigest('MD5', data);
        return EncodingUtil.base64Encode(hash);
    }   

    // returns 100 recent records 
    public static List<Person__c> getRecentHealthChanges(){


        return [SELECT Id,Name, Token__c, Status_Update_Date__c, Mobile__c, Health_Status__c FROM Person__c ORDER BY Status_Update_Date__c  DESC NULLS LAST LIMIT 100];

    }



    // search based on Name,Mobile and Token

    public static List<Person__c> searchPeople(String searchTerm){

        searchTerm = '%'+searchTerm +'%';
        return [SELECT Id, Name,Token__c, Status_Update_Date__c, Mobile__c, Health_Status__c  FROM Person__c WHERE Name LIKE :searchTerm OR Mobile__c LIKE :searchTerm OR Token__c LIKE :searchTerm  ORDER BY Status_Update_Date__c NULLS LAST ];
    }


    // get person by id 
    public static Person__c getPersonById(String personId){

        List<Person__c> persons = [SELECT Id, Name,Token__c, Status_Update_Date__c, Mobile__c, Health_Status__c  FROM Person__c WHERE Id = :personId ];
        if(persons != null && persons.size() > 0)
            return persons.get(0);
        return null;
    }

}
