// JScript File
YAHOO.namespace("UNCHS.AutoCompleteGrid");
YAHOO.UNCHS.AutoCompleteGrid = function(aautoCompleteData,atableData,anameField,acontainer,adropButton,aaddButton,aerrorField,atableField) {
    // Instantiate DataSources
    this.autoCompleteData = aautoCompleteData;
    this.tableData = atableData;
    this.nameField = anameField;
    this.container = acontainer;
    this.dropButton = adropButton;
    this.addButton = aaddButton;
    this.errorField = aerrorField;
    this.tableField = atableField;
    this.init = function()
    {
        // Init AutoComplete
        var bDS = new YAHOO.util.LocalDataSource(this.autoCompleteData);
        bDS.responseSchema = {fields : ["name", "id"]}; 
        // Instantiate AutoCompletes
        var oConfigs = {
            prehighlightClassName: "yui-ac-prehighlight",
            useShadow: true,
            queryDelay: 0,
            minQueryLength: 0,
            animVert: .01
        }
        var bAC = new YAHOO.widget.AutoComplete(this.nameField, this.container, bDS, oConfigs);
    
        var bToggler = YAHOO.util.Dom.get(this.dropButton);
        var oPushButtonB = new YAHOO.widget.Button({container:bToggler});
        var toggleB = function(e) {
            //YAHOO.util.Event.stopEvent(e);
            if(!YAHOO.util.Dom.hasClass(bToggler, "open")) {
                YAHOO.util.Dom.addClass(bToggler, "open")
            }
            
            // Is open
            if(bAC.isContainerOpen()) {
                bAC.collapseContainer();
            }
            // Is closed
            else {
                bAC.getInputEl().focus(); // Needed to keep widget active
                setTimeout(function() { // For IE
                    bAC.sendQuery("");
                },0);
            }
        }
        oPushButtonB.on("click", toggleB);
        bAC.containerCollapseEvent.subscribe(function(){YAHOO.util.Dom.removeClass(bToggler, "open")});
        var errorObj = YAHOO.util.Dom.get(this.errorField);
        var onAddClick = function(e){
            alert(errorObj);
            alert(bAC.getInputEl().value.length);
            if(bAC.getInputEl().value.length == 0)
            {
                errorObj.style.display = "block";
                errorObj.innerHTML = "Cannot Add empty data.";
            }
        }
        var addBtnObject = new YAHOO.widget.Button(this.addButton);
        addBtnObject.on("click", onAddClick);
        
        //Add Table 
        var tDS = new YAHOO.util.LocalDataSource(this.tableData);
        var tableColumnDefs = [
            {key:"id", sortable:true, resizeable:true},
            {key:"name", formatter:YAHOO.widget.DataTable.forma, sortable:true, resizeable:true}
        ];
        
        var dataTable = new YAHOO.widget.DataTable(this.tableField,
                tableColumnDefs, tDS, {caption:"DataTable Caption"});


    };
}

YAHOO.namespace("UNCHS.AutoCompleteGrid.AutoComplete");
YAHOO.UNCHS.AutoCompleteGrid = function(aautoCompleteData,anameField,acontainer,adropButton,aaddButton){
        
}

YAHOO.namespace("UNCHS.NameObject");
YAHOO.UNCHS.NameObject = function(aid,aname,atype)
{
    this.id = aid;
    this.name = aname;
    this.type = atype;
}