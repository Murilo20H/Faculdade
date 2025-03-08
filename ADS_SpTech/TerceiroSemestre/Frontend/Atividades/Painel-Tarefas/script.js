const taskForm = document.getElementById('task-form');
const taskInput = document.getElementById('task-input');
const taskList = document.querySelector('.task-list');
const taskHideButton = document.querySelector('#task-hide-button');
const taskShowButton = document.querySelector('#task-show-button');

const progressBar = document.querySelector('.progress-bar');
const progressText = document.querySelector('.progress-text');



taskForm.addEventListener('submit', (event) => {

    event.preventDefault();

    const listItem = document.createElement('li');
    addTask(listItem);

})


taskHideButton.addEventListener('click', () => {
    const vetorDeLIs = Array.from(taskList.children);
    if (taskHideButton.dataset.action === 'hide') {

        vetorDeLIs.forEach((li) => {
            const checkbox = li.querySelector('input');

            if (checkbox.checked) {
                li.style.display = "none";
            }
        })
        taskHideButton.dataset.action = "show";
        taskHideButton.textContent = "Mostrar Tarefas";

    } else {
        vetorDeLIs.forEach((li) => {
            li.style.display = "flex";

        })

        taskHideButton.dataset.action = "hide";
        taskHideButton.textContent = "Ocutar Concluídas";
    }

})

const addTask = (listItem, task) => {

    const taskDescription = task ? task.text : taskInput.value;
    const taskSpan = document.createElement('span');
    const taskFormInput = document.createElement('input');
    const taskEditButton = document.createElement('button');
    const taskDeleteButton = document.createElement('button');

    taskFormInput.checked = task?.done;

    taskEditButton.addEventListener('click', (event) => {
        const novaTarefa = prompt(`Qual a nova descrição para a tarefa? ${taskSpan.textContent}:`, taskSpan.textContent)

        console.log('nova tarefa:', novaTarefa);


        if (novaTarefa == null) {
            return;
        }
        const tarefaFormatada = novaTarefa.trim();
        if (novaTarefa != "") {
            taskSpan.textContent = tarefaFormatada;
            updateProgressBar();
        }

    })

    taskFormInput.addEventListener('change', () => {
        updateProgressBar();

    })

    taskDeleteButton.addEventListener('click', (event) => {
        const confirmacao = confirm("Deseja prosseguir com a exclusão?")
        if (confirmacao) {
            taskList.removeChild(listItem);
            updateProgressBar();
        }
    })

    listItem.classList.add('task-item');

    taskFormInput.type = 'checkbox';

    taskEditButton.innerHTML = "✏️";
    taskDeleteButton.innerHTML = "🗑️";

    taskSpan.textContent = taskDescription;

    listItem.appendChild(taskFormInput);
    listItem.appendChild(taskSpan);
    listItem.appendChild(taskEditButton);
    listItem.appendChild(taskDeleteButton);

    taskList.appendChild(listItem);
    updateProgressBar();


}


const updateProgressBar = () => {
    const taskLength = Array.from(taskList.children).length;
    const doneArray = [...taskList.children].filter((li) => li.querySelector('input').checked);


    const doneLength = doneArray.length;
    const percentual = taskLength > 0 ? doneLength / taskLength * 100 : 0;

    progressBar.style.width = `${percentual}%`;
    progressText.textContent = `${doneLength}/${taskLength} concluídos (${percentual.toFixed(1)}%)`;
    saveTasks();
}



const saveTasks = () => {

    const tasks = [...taskList.children].map((li) => {
        const isChecked = li.querySelector('input').checked;
        const spanText = li.querySelector('span').textContent;
        const newJson = {
            text: spanText,
            done: isChecked
        }
        return newJson;

    })

    localStorage.setItem('tasks', JSON.stringify(tasks));
}


const getTasks = () => {
    const tasks = JSON.parse(localStorage.getItem('tasks') || "[]");


    tasks.forEach((task) => {
        const listItem = document.createElement('li');
        addTask(listItem, task);
    })
}

window.addEventListener('load', () => {
    getTasks();
})
