public with sharing class ToolingAPIHelper 
{
    public static string getSessionID()
    {
        return UserInfo.getSessionID();
    }

    public static void packageInstall()
    {
        string baseUrl = URL.getSalesforceBaseUrl().toExternalForm();
        string url = baseUrl + '/services/data/v49.0/tooling/sobjects/PackageInstallRequest';
        string sessionId = getSessionID();

        Map<string, object> dataMap = new Map<string, object>();
        dataMap.put('SubscriberPackageVersionKey', '04t30000001DWL0');
        dataMap.put('SecurityType', 'None');
        dataMap.put('NameConflictResolution', 'Block');

        string body = JSON.serialize(dataMap);

        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer ' + sessionId);

        if(body != null)
        {
            request.setBody(body);
        }

        try 
        {
            Http http = new Http();
            HttpResponse response = http.send(request);
            string responseString = response.getBody();

            system.debug(responseString);

        } 
        catch (Exception ex)
        {
            system.debug(ex.getMessage());
        }
    }
}