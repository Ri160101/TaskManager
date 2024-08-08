class TaskManager {
    ArrayList<MyTasks> tasks = new ArrayList<MyTasks>();
    int id = 0;

    /*
    title：タスクのタイトル
    description：タスクの詳細
    dueDate：タスクの期限(YYYYMMDD)
    priority：タスクの優先度(1高、2中、3低)
    tag：タスクのタグのリスト
    */
    void addTask(String title, String description, int dueDate, int priority) {
        ArrayList<String> tag = new ArrayList<String>();
        MyTasks newTask = new MyTasks(id, title, description, dueDate, priority, tag);
        tasks.add(newTask);
        id++;
    }

    void editTask(int taskId, String newTitle, String newDescription, int newPriority) {
        tasks.get(taskId).editTitle(newTitle);
        tasks.get(taskId).editDescription(newDescription);
        tasks.get(taskId).editPriority(newPriority);
    }

    //タスクの取得
    MyTasks getTask(int taskId) {
        return tasks.get(taskId);
    }

    //taskId番目のタスクを削除
    void removeTask(int taskId) {
        tasks.remove(taskId);

        //taskIdの更新
        for(int i = 0; i < tasks.size(); i++) {
            tasks.get(i).taskId = i;
        }
        id--;
    }

    //タグの追加
    void addTag(int taskId, String newTag) {
        tasks.get(taskId).addTag(newTag);
    }

    //タグの削除
    void removeTag(int taskId, String tag) {
        tasks.get(taskId).removeTag(tag);
    }

    /*
    タスクの検索
    keywordがタイトルかタグに含まれていれば返す
    */
    ArrayList<MyTasks> searchTasks(String keyword) {
        ArrayList<MyTasks> newTasks = new ArrayList<MyTasks>();

        boolean flag = false;
        for(int n = 0; n < tasks.size(); n++) {
            //タイトルの検索
            if(tasks.get(n).title.equals(keyword)) {
                flag = true;
            }

            //タグの検索
            int i = 0;
            while(i < tasks.get(n).tags.size() && !flag) {
                if(tasks.get(n).tags.get(i).equals(keyword)) {
                    flag = true;
                }
                i++;
            }

            if(flag) {
                newTasks.add(tasks.get(n));
            }
            flag = false;
        }

        return newTasks;
    }
}
