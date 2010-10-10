%module tellduscore
%{
#include "telldus-core.h"
%}

%rename(close) tdClose;
%rename(release_string) tdReleaseString;
%rename(turn_on) tdTurnOn;
%rename(turn_off) tdTurnOff;
%rename(bell) tdBell;
%rename(dim) tdDim;
%rename(learn) tdLearn;
%rename(last_sent_command) tdLastSentCommand;
%rename(last_sent_value) tdLastSentValue;
%rename(number_of_devices) tdGetNumberOfDevices;
%rename(get_device_id) tdGetDeviceId;
%rename(get_device_type) tdGetDeviceType;
%rename(get_name) tdGetName;
%rename(set_name) tdSetName;
%rename(get_protocol) tdGetProtocol;
%rename(set_protocol) tdSetProtocol;
%rename(get_model) tdGetModel;
%rename(set_model) tdSetModel;
%rename(set_device_parameter) tdSetDeviceParameter;
%rename(get_device_parameter) tdGetDeviceParameter;
%rename(add_device) tdAddDevice;
%rename(remove_device) tdRemoveDevice;
%rename(get_error_string) tdGetErrorString;
%rename(send_raw_command) tdSendRawCommand;

%include "telldus-core.h"
