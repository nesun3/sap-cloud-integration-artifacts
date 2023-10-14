import com.sap.it.api.mapping.*;

//Add MappingContext as an additional argument to read or set Headers and properties.

def String customFunc(String input1, String input2, String input3){
	if((!(input1.trim().isEmpty())) || (!(input2.trim().isEmpty())))
		return input3;
	else{
		input3 = "";
		return input3;
	}
}
