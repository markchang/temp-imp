const TEMPER_URL = "the_url";

device.on("temperature", function(temperature) {
    server.log(format("%3.1fC", temperature));
    send_temperature(temperature);
})

function send_temperature(temp_in_c) {    
    local body = http.jsonencode({ value = temp_in_c });
    local data = http.urlencode({ value = temp_in_c });
    local request = http.post(TEMPER_URL, {}, data);
    
    local resp = request.sendsync();
    server.log(data);
    server.log(resp.statuscode + ": " + resp.body);
}
