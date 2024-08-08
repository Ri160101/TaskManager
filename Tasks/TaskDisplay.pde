class ResultOfSearch {
  JDialog dialog;
  JTextArea textArea;
  JScrollPane scrollPane;
  ArrayList<MyTasks> tasks;

  ResultOfSearch(ArrayList<MyTasks> tasks0) {
    dialog = new JDialog((Frame) null, "検索結果", true);
    dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
    dialog.setSize(800, 600);
    tasks = tasks0;
  }

  void display() {
    textArea = new JTextArea(20, 50);
    for(int i = 0; i < tasks.size(); i++) {
      textArea.append(tasks.get(i).taskId + "," + tasks.get(i).title + "\n");
    }
    textArea.setEditable(false);

    scrollPane = new JScrollPane(textArea);
    dialog.getContentPane().add(scrollPane, BorderLayout.CENTER);

    dialog.setVisible(true);
  }
}

class DisplayTask {
  JDialog dialog;
  JTextArea textArea;
  JScrollPane scrollPane;
  MyTasks task;

  DisplayTask(MyTasks task0) {
    dialog = new JDialog((Frame) null, "検索結果", true);
    dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
    dialog.setSize(800, 600);
    task = task0;
  }
    void display() {
    textArea = new JTextArea(20, 50);
    textArea.append("タスクID：" + task.taskId + "\n");
    textArea.append("タイトル：" + task.title + "\n");
    textArea.append("詳細：" + task.description + "\n");
    textArea.append("期日：" + task.dueDate + "\n");
    if(task.tags.size() > 0) {
      textArea.append("---タグの一覧---\n");
      for(int i = 0; i < task.tags.size(); i++) {
        textArea.append(task.tags.get(i) + "   ");
      }
    }
    textArea.setEditable(false);

    scrollPane = new JScrollPane(textArea);
    dialog.getContentPane().add(scrollPane, BorderLayout.CENTER);

    dialog.setVisible(true);
  }
}
