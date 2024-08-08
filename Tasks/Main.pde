// テキストボックス用のライブラリ
import javax.swing.*;
import java.awt.*;

TaskManager taskManager;
String title = "";
String description = "";
int priority;
int dueDate;
int taskId;
String tag = "";
String keyword = "";

public void settings() {
  size(800, 600);
}

void setup(){
  PFont font = createFont("游明朝 Light", 50);
  textFont(font);
  fill(0);
  textSize(16);
  taskManager = new TaskManager();
}

void draw(){
  background(255);
  displayKeyGuide();
  displayTask();
}

void displayKeyGuide(){
  text("キー操作ガイド:", 20, 30);
  text("a - タスクの追加", 20, 60);
  text("e - 既存タスクの編集", 20, 90);
  text("r - タスクの削除", 20, 120);
  text("t - タグの追加", 20, 150);
  text("u - タグの削除", 20, 180);
  text("c - コメントの追加", 20, 210);
  text("s - タスクの検索", 20, 240);
  text("d - タスクの詳細", 20, 270);
}

void displayTask(){
  int y = 330;
  for(MyTasks task : taskManager.tasks){
    text(task.taskId + " : " + task.title, 20, y);
    y += 30;
  }
}


void keyPressed() {
  if (key == 'a') {  
    // タスクの追加
    TextBox tbTitle = new TextBox("タスクの追加", "タスクのタイトルを入力してください");
    title = tbTitle.getInputString();
    if (title != null) {
      TextBox tbDesc = new TextBox("タスクの追加", "タスクの詳細を入力してください:");
      description = tbDesc.getInputString();
      if (description != null) {
        TextBox tbDueDate = new TextBox("タスクの追加", "タスクの期限を入力してください (20240101):");
        dueDate = tbDueDate.getInputInt();
        if (dueDate >= 0) {
          TextBox tbPriority = new TextBox("タスクの追加", "タスクの優先度を入力してください (1:高, 2:中, 3:低):");
          priority = tbPriority.getInputInt();
          if (priority >= 0) {
            taskManager.addTask(title, description, dueDate, priority);
          }
        }
      }
    }
  } else if (key == 'e') {
    // タスクの編集
    TextBox TBId = new TextBox("タスクの編集", "タスクのIDを入力してください");
    taskId = TBId.getTaskId(taskManager.tasks.size());
    if (taskId != -1) {
      TextBox TBTitle = new TextBox("タスクの編集", "タスクのタイトルを入力してください。");
      title = TBTitle.getInputString();
      if (title != null) {
        TextBox tbDesc = new TextBox("タスクの編集", "タスクの詳細を入力してください。");
        description = tbDesc.getInputString();
        if (description != null) {
          TextBox tbPriority = new TextBox("タスクの編集", "タスクの優先度を入力してください (1:高, 2:中, 3:低)。");
          priority = tbPriority.getInputInt();
          if (priority >= 0) {
            taskManager.editTask(taskId, title, description, priority);
          }
        }
      }
    }
  } else if (key == 'r') {
    // タスクの削除
    TextBox TBId = new TextBox("タスクの削除", "タスクのIDを入力してください");
    taskId = TBId.getTaskId(taskManager.tasks.size());
    if (taskId != -1) {
      taskManager.removeTask(taskId);
    }
  } else if (key == 't') {
    // タグの追加
    TextBox TBId = new TextBox("タグの追加", "タスクのIDを入力してください");
    taskId = TBId.getTaskId(taskManager.tasks.size());
    if (taskId != -1) {
      TextBox TBTag = new TextBox("タグの追加", "タグを入力してください");
      tag = TBTag.getInputString();
      if (tag != null) {
        taskManager.addTag(taskId, tag);
      }
    }
  } else if (key == 'u') {
    // タグの削除
    TextBox TBId = new TextBox("タグの削除", "タスクのIDを入力してください");
    taskId = TBId.getTaskId(taskManager.tasks.size());
    if (taskId != -1) {
      TextBox TBTag = new TextBox("タグの削除", "タグを入力してください");
      tag = TBTag.getInputString();
      if (tag != null) {
        taskManager.removeTag(taskId, tag);
      }
    }
  } else if (key == 's') {
    // タスクの検索
    TextBox TBKeyword = new TextBox("タスクの検索", "検索キーワードを入力してください");
    keyword = TBKeyword.getInputString();
    if (keyword != null) {
      ArrayList<MyTasks> resultTasks = taskManager.searchTasks(keyword);
      ResultOfSearch resultOfSearch = new ResultOfSearch(resultTasks);
      resultOfSearch.display();
    }
  } else if (key == 'd') {
    // タスクの詳細
    TextBox TBDescription = new TextBox("タスクの詳細", "タスクのIDを入力してください");
    taskId = TBDescription.getTaskId(taskManager.tasks.size());
    if (taskId != -1) {
      DisplayTask displayTask = new DisplayTask(taskManager.getTask(taskId));
      displayTask.display();
    }
  }
}
