class TextBox {
  String title;
  String message;
  JLayeredPane pane;
  JPanel panel;
  JTextField textbox;
  int textBoxWidth = 400;  // テキストボックスのウィンドウの幅
  int textBoxHeight = 100;  // テキストボックスのウィンドウの高さ
  int responseTextWindow = -1;  // テキストボックスからの返り値（0:OK, 2:取消, -1:ウィンドウを閉じる）
  String inputText = "";  // テキストボックスで入力した文字列を格納するための変数
  TextBox(String title0, String message0) {
      title = title0;
      message = message0;
  }

  String makeTextBox() {
    Canvas canvas = (Canvas) surface.getNative();
    pane = (JLayeredPane) canvas.getParent().getParent();
    panel = new JPanel();
    panel.setPreferredSize(new Dimension(textBoxWidth, textBoxHeight));  // テキストボックス用のウィンドウのサイズを指定
    BoxLayout layout = new BoxLayout(panel, BoxLayout.Y_AXIS);
    panel.setLayout(layout);
    panel.add(new JLabel("<html><span style='font-size:16px'>" + message + "</span></html>"));

    // テキストボックス
    textbox = new JTextField();
    textbox.setFont(new Font("游明朝 Light", Font.PLAIN, 24));  // テキストボックスにおけるフォントの設定
    panel.add(textbox);

    // テキストボックスのウィンドウの生成
    responseTextWindow = JOptionPane.showConfirmDialog(null, panel, title, JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
    
    // テキストボックスのウィンドウに対し行われた入力への対処
    switch(responseTextWindow) {
      case 0:  // テキストボックスで「OK」ボタンが押された場合
      inputText = textbox.getText();  // テキストボックスへの入力値を取得  
      if(inputText.equals("") ){  // 文字列の入力をせず「OK」ボタンが押された場合の処理
        inputText = null;
      } 
      break;
    case 2:  // テキストボックスで「取消」ボタンが押された場合
      inputText = null;
      break;
    case -1: // テキストウィンドウの「×」ボタンでウィンドウが閉じられた場合
      inputText = null;
      break;   
    }
    return inputText;
  }
  
  String getInputString() {
    return makeTextBox();
  }

  int getInputInt() {
    while (true) {
      String input = makeTextBox();
      if(input == null){
        return -1;
      }
      try { 
        return Integer.parseInt(input);
      } catch (NumberFormatException e) {
        JOptionPane.showMessageDialog(null, "有効な整数を入力してください。", "入力エラー", JOptionPane.ERROR_MESSAGE);
      }
    }
  }

  int getTaskId(int maxTaskId) {
    while (true) {
      int taskId = getInputInt();
      if (taskId == -1 || (taskId >= 0 && taskId < maxTaskId)) {
        return taskId;
      } else {
        JOptionPane.showMessageDialog(null, "有効なタスクIDを入力してください。", "入力エラー", JOptionPane.ERROR_MESSAGE);
      }
    }
  }
}
