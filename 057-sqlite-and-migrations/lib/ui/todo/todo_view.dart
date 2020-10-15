import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sqflite_migration_example/ui/todo/todo_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TodoView extends HookWidget {
  const TodoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todoController = useTextEditingController();
    var descriptionController = useTextEditingController();

    return ViewModelBuilder<TodoViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            model.addTodo(todoController.text, descriptionController.text);
            todoController.clear();
            descriptionController.clear();
          },
          child: !model.isBusy
              ? Icon(Icons.add)
              : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: todoController,
                  decoration: InputDecoration(hintText: 'Add a todo'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(hintText: 'Add a description'),
                ),
              ),
              if (model.dataReady && model.data.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: model.data.length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 40,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model.data[index].title),
                              Text(
                                model.data[index].description ?? '',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: model.data[index].isComplete,
                            onChanged: (value) =>
                                model.setCompleteForItem(index, value),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              if (model.dataReady && model.data.isEmpty)
                Text('No todo\'s yet. Add some'),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => TodoViewModel(),
    );
  }
}
