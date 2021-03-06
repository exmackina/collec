/*
 * Scripts permettant de gerer un formulaire de saisie des metadonnees
 * une fois le modele cree
 */

/**
 * Cree le formulaire pour la saisie des informations
 * 
 * @param formdef
 * @returns
 */

 function getSchema(formdef){
    // récupération du schéma du form
    var schema = {
            "type":"object",
            "properties": {}
    };
    
    var baseProps = function (index, value) {
        var prop = {
            "type": value.type
        };

        if (value.type=="select"){
            prop.enum=value.choiceList;
            if (value.required && prop.enum && prop.enum.length > 0){
                prop.default = prop.enum[0];
            }
        }

        if (value.required){
            prop.required = value.required;
        }
        
        return prop;
    };
    
    $.each(formdef,function(index, value){
        var prop = baseProps(index, value);
        
        schema.properties[value.name] = prop;
    });
    return schema;
}

// ===========================================================//
// récupération des options du form
 var baseFields = function (index, value) {
     var field = {
        "type": value.type
    };

    if(value.type != "checkbox"){
        field.label = value.name;
    }

    if(value.type=="string"){
        field.type="text";
    }

    if(value.type=="string" || value.type=="number" || value.type=="textarea"){
        field.placeholder = value.measureUnit;
    }
    
    if (value.choiceList){
        
        field.optionLabels = $.map( value.choiceList, function( v, i){
            return v.text;
        });
        field.sort = function(a, b) { 
                                return 0; 
                        }
        field.removeDefaultNone = false;
    }
    if (value.type == "checkbox"){
        field.rightLabel = value.name;
    }

    if(value.type == "time"){
        field.dateFormat = "HH:mm:ss";
    }

    if(value.type == "date"){
        field.dateFormat = "DD/MM/YYYY";
    }
    
    if (value.helperChoice){
        field.helper = value.helper;
    }
    return field;
};

function getOptions(formdef){
    var options = {
            "fields": {}
    };
    $.each(formdef,function(index, value){
        var field = baseFields(index, value);
        options.fields[value.name] = field;
    });
    return options;
}

// ===========================================================//
// construction du formulaire
function showForm(value, data=""){

    var schema = getSchema(value);
    var options = getOptions(value);
    var config = {
        "data" : data,
        "schema" : schema,
        "options" : options,
        "postRender": function(control) {
        	var value = control.getValue();
            var metadataField = $("#metadata_schema");
                control.on("change",function(){
                metadataField.val(JSON.stringify(value, null,null));
                });
                 control.on("mouseout",function(){
                	 metadataField.val(JSON.stringify(value, null,null));
                });
                 metadataField.val(JSON.stringify(value, null,null));
            }
    }
    var exists = $("#metadata").alpaca("exists");
    if (exists){
         $("#metadata").alpaca("destroy");
    }
    $("#metadata").alpaca(config);
}