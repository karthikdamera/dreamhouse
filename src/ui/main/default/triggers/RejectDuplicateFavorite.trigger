trigger RejectDuplicateFavorite on Favorite__c (before insert) {
    

    
    Favorite__c favorite = Trigger.New[0];
    List<Favorite__c> dupes = [Select Id FROM Favorite__C WHERE Property__c = :favorite.Property__c AND User__c = :favorite.User__c];
    if (!dupes.isEmpty()) {
        favorite.addError('duplicate');
    }

}