import 'package:get/get.dart';

class ASRModuleLogic extends GetxController {
  /// status有五个阶段分别是 点击说话 正在说话(点击停止) 重新说话(正在识别) 重新说话(识别成功/失败)
  int status = 0;
  String statusText = "描述希望记录的账单";
  String promptText = "点击说话";
  var info = [
    {
      "statusText": "描述希望记录的账单",
      "promptText": "点击说话",
      "content": "",
    },
    {
      "statusText": "正在说话...",
      "promptText": "点击停止",
      "content": "",
    },
    {
      "statusText": "正在识别...",
      "promptText": "点击重新说话",
      "content": "",
    },
    {
      "statusText": "识别成功",
      "promptText": "点击重新说话",
      "content": "",
    },
    {
      "statusText": "识别失败",
      "promptText": "点击重新说话",
      "content": "",
    },
  ];

  void clickBtn() {

    if (status == 0) {
      startTalking();
    } else if (status == 1) {
      stopTalking();
    } else {
      talkAgain();
    }
  }

  void startTalking() {
    status = 1;
    update();
  }

  void stopTalking() {
    status = 2;
    update();
    asr();
  }

  void asr(){
    Future.delayed(Duration(seconds: 3),(){
      status=3;
      update();
    });

  }
  //
  void talkAgain() {
    status = 1;
    update();
  }
}
