/**
 * @author phantom22 on github
 * open lua_api_documentation.html, open the console and enter this script to extract the docs.
 * */
(function(){

    const th = [...document.getElementsByTagName("th")];

    /**
     * @param {string} param 
     * @returns {string}
     */
    function parseParam(param) {
        //console.log(param);
        let clean = param.replaceAll(/\{.*\}/g,"(table)");
        
        let [name,type] = clean.split(":");

        if (!type||type==="undefined") type = "string";
        let option_start = type.indexOf("=");
        let is_option = "";
        if (option_start !== -1) {
            is_option = "?";
            type = type.slice(0,option_start-1);
        }
        type = parseType(type);
        return `@param ${name} ${type}${is_option}`
    }
    /**
     * @param {string} param 
     * @returns {string}
     */
    function parseReturn(param) {
        //console.log(param);
        let clean = param.replaceAll(/\{.*\}/g,"(table)").replaceAll(/\s/g,"_");
        
        let split_start = clean.indexOf(":"), name, type;

        if (split_start===-1) {
            type = clean;
            name = "";
        }
        else {
            [name,type] = clean.split(":");
            name = " " + name;
        }
        type = parseType(type);
        return `@return ${type}${name}`
    }
    /**
     * @param {string} type
     * @returns {string}
     */
    function parseType(type) {
        //console.log(type)
        switch (type) {
            case "int":
                return "integer";
            case "bool":
                return "boolean";
            case "component_id":
                return "integer";
            case "multiple_types":
                return "table";
            default:
                return type;
        }
    }
    /**
     * @param {number} function_index
     * @returns {string}
     */
    function extrapolate_fn(function_index) {
        if (function_index<0||function_index>=th.length) return;
        let functionBody = th[function_index].textContent,
            start = functionBody.indexOf("(");

        let name_str = functionBody.slice(0,start);

        let args_str = functionBody.slice(start+1,-2).trim(), raw_args, args;

        //console.log({function_index,name_str,args_str});
        if (args_str!=="") {
            raw_args = args_str.split(", "),
            args = raw_args.map(v => parseParam(v));
        }

        let returns_str = th[function_index+1].textContent.trim(), returns;
        if (returns_str!=="") returns = returns_str.split(", ").map(v => parseReturn(v));

        let description_str = th[function_index+2].textContent;

        //let o = `${description_str===""?"":`---${description_str}\n`}${args_str!==""?`---${args.join("\n---")}\n---`:""}${returns_str!==""?`${returns.join("\n---")}\n`:""}function ${name_str}( ${raw_args.map(v => v.split(":")[0]).join(", ").trim()} )${returns_str!==""?" ":"\n---@diagnostic disable-next-line: missing-return\n"}end`;

        let o = (description_str !== "" ? `---${description_str}\n` : "") +
                (args_str        !== "" ? `---${args.join("\n---")}\n` : "") +
                (returns_str     !== "" ? `---${returns.join("\n---")}\n` : "") +
                `function ${name_str}(` + (args_str !== "" ? ` ${raw_args.map(v => v.split(":")[0]).join(", ").trim()} ` : "") + ")" +
                (returns_str     !== "" ? "\n---@diagnostic disable-next-line: missing-return\n" : " ") + "end";//${returns_str!==""?" ":"\n---@diagnostic disable-next-line: missing-return\n"}end;

        return o
    }

    let o = [];
    for (let i=0; i<th.length; i+=3)
        o.push(extrapolate_fn(i));

    console.log(o.join("\n\n"));

})()
