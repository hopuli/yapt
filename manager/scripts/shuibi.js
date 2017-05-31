var sbUtils = {
/**
     * ajax文件上传
     * @config 请求配置对象
     * @config {
	 * 	url: string 请求路径 必填参数
	 * 	method: string 请求方式GET或POST 非必填 默认POST
	 * 	async: boolean 是否异步请求 非必填 默认true
	 * 	data: Object 请求参数 必填参数至少包含文件对象
	 * 	headers: object 请求头信息 非必填
	 *  onprogress: function(percent) 请求过程回调函数 非必填
	 *  success: function(data) 请求成功回调函数 非必填
	 *  error: function(status) 请求失败回调函数 非必填
	 * }
     * @author 267086
     * @date 2016-3-10
     **/
    fileUpload: function(config){
        var confObj = config;
        var xhr = (window.XMLHttpRequest)?new window.XMLHttpRequest():new window.ActiveXObject("Microsoft.XMLHTTP");
        var formData = new FormData();
        var loaded, loadTotal, loadPercent;
        // 将请求参数对象添加到表单
        if(confObj.data && confObj.data.constructor === Object){
            for(var key in confObj.data){
                formData.append(key, confObj.data[key]);
            }
        }
        // 初始化请求参数，但并不发送
        xhr.open(confObj.method?confObj.method:'POST', confObj.url, confObj.async?confObj.async:true);
        // 设置请求头信息
        xhr.setRequestHeader("Accept", "application/json, text/plain, */*");
        if(confObj.headers && confObj.headers.constructor === Object){
            for(var key in confObj.headers){
                xhr.setRequestHeader(key, confObj.headers[key])
            }
        }
        //xhr.withCredentials = true;
        // 请求完成函数
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){// 4 = "loaded"
                // 传输过程函数
                if(xhr.status == 200){// 200 = OK
                    if(confObj.success && 'function' === typeof(confObj.success)) confObj.success.call(this, JSON.parse(xhr.responseText));
                }else{
                    if(confObj.error && 'function' === typeof(confObj.error)) confObj.error.call(this, xhr.status);
                }
            }
        };
        xhr.upload.onprogress = function(evt) {
            loaded = evt.loaded;
            loadTotal = evt.total;
            loadPercent = Math.floor(100 * loaded / loadTotal); //已经上传的百分比
            if(confObj.onprogress && 'function' === typeof(confObj.onprogress)) confObj.onprogress.call(this, loadPercent);
        };
        // 发送请求
        xhr.send(formData);
    }
}
