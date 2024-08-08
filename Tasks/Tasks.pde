class MyTasks {
    String title, description;
    int taskId, priority, dueDate;
    ArrayList<String> tags;

    MyTasks(int taskId0, String title0, String description0, 
            int dueDate0, int priority0, ArrayList<String> tags0) {
        //それぞれの変数の初期化
        taskId = taskId0;
        title = title0;
        description = description0;
        dueDate = dueDate0;
        priority = priority0;
        tags = tags0;
    }

    //タイトルの編集
    void editTitle(String newTitle) {
        title = newTitle;
    }

    //詳細の編集
    void editDescription(String newDescription) {
        description = newDescription;
    }

    //優先度の編集
    void editPriority(int newPriority) {
        priority = newPriority;
    }

    //タグの追加
    void addTag(String newTag) {
        tags.add(newTag);
    }

    //タグの削除
    void removeTag(String tag) {
        int n = 0;
        while(n < tags.size() && !tags.get(n).equals(tag)) {
            n++;
        }

        if(n < tags.size()) {
            tags.remove(n);
        }
    }
}
