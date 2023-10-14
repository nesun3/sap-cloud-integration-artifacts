import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;
import com.sap.it.api.ITApiFactory;
import com.sap.it.api.mapping.ValueMappingApi
import com.sap.it.api.securestore.SecureStoreService
import com.sap.it.api.securestore.UserCredential
import com.sap.it.api.securestore.exception.SecureStoreException

def Message processData(Message message) {
    def apikey_alias = message.getProperty("ApiKeyAlias")
    def secureStorageService =  ITApiFactory.getService(SecureStoreService.class, null)
    try{
        def secureParameter = secureStorageService.getUserCredential(apikey_alias)
        def apikey = secureParameter.getPassword().toString()
        message.setHeader("x-apikey", apikey);
        message.setHeader("Content-Type", "application/json");
    } catch(Exception e){
        throw new SecureStoreException("Secure Parameter not available")
    }
    return message;
}