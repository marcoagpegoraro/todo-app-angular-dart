import 'dart:convert';
import 'dart:html' hide Client;

import 'package:angular/angular.dart';
import 'package:angular_app/utils/utils.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart' as http;
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'dashboard',
  templateUrl: 'dashboard.html',
  styleUrls: [
    '../../app_component.css',
  ],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
class Dashboard extends OnInit {
  @ViewChild('modal')
  Element modal;

  @ViewChild('modalButton')
  Element modalButton;

  int id;
  String name;
  bool done;

  var todos;

  @override
  void ngOnInit() {
    getTodos();
  }

  openModal([todo]) {
    this.modal.classes.toggle('is-active');
  
    if(todo == null){
      modalButton.addEventListener('click', (event){
        event.preventDefault();
        handleInsert();
      });
    }
    else{
      this.id = todo['id'];
      this.name = todo['name'];
      this.done = todo['done'];
      modalButton.addEventListener('click', (event){
        event.preventDefault();
        handleUpdate();
      });
    }

  }

  closeModal() {
    this.modal.classes.toggle('is-active');
    resetModalFields();
    modalButton.removeEventListener('click', (event){});
  }

  resetModalFields() {
    id = null;
    name = null;
    done = null;
  }

  getTodos() async {
    var response = await http.get("${Utils.baseUrl}/todo", headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': window.localStorage['token']
    });

    todos = jsonDecode(response.body);
  }

  handleInsert() async {
    await http.post("${Utils.baseUrl}/todo",
    body: {
      name: name,
      done: done
    },
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': window.localStorage['token']
    });

    closeModal();
  }

  handleUpdate() async {
    await http.put("${Utils.baseUrl}/todo/${id}",
    body: {
      name: name,
      done: done
    },
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': window.localStorage['token']
    });
    
    closeModal();
  }

  handleDelete(todo) async {
    if (window.confirm("Excluir a tarefa '${todo['name']}'?")) {
      await http.delete("${Utils.baseUrl}/todo/${todo['id']}",
          headers: {'Authorization': window.localStorage['token']});

      getTodos();
    }
  }
}
