function deleteStudents() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idStudent]:checked')
    if(checkedCheckboxs.length == 0){
        alert("Пожалуйста, выберете хотя бы одного студента");
        return;
    }

    var ids = "";
    for (var i = 0; i < checkedCheckboxs.length; i++){
        ids = ids + checkedCheckboxs[i].value + " "
    }

    document.getElementById("idsHiddenDelete").value = ids;
    document.getElementById("deleteForm").submit();

}
function deleteDisciplines() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idDiscipline]:checked')
    if(checkedCheckboxs.length == 0){
        alert("Пожалуйста, выберете хотя бы одну дисциплину");
        return;
    }

    var ids = "";
    for (var i = 0; i < checkedCheckboxs.length; i++){
        ids = ids + checkedCheckboxs[i].value + " "
    }

    document.getElementById("idsHiddenDelete").value = ids;
    document.getElementById("deleteForm").submit();

}

function modifyStudents() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idStudent]:checked')
    if(checkedCheckboxs.length == 0){
        alert("Пожалуйста, выберете одного студента");
        return;
    }
    if(checkedCheckboxs.length > 1){
        alert("Пожалуйста, выберете только одного студента");
        return;
    }

    var id = checkedCheckboxs[0].value;

    document.getElementById("idHiddenModify").value = id;
    document.getElementById("modifyForm").submit();

}

function modifyDisciplines() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idDiscipline]:checked')
    if(checkedCheckboxs.length == 0){
        alert("Пожалуйста, выберете одну дисциплину");
        return;
    }
    if(checkedCheckboxs.length > 1){
        alert("Пожалуйста, выберете только одну дисциплину");
        return;
    }

    var id = checkedCheckboxs[0].value;

    document.getElementById("idHiddenModify").value = id;
    document.getElementById("modifyForm").submit();

}

function progressStudent() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idStudent]:checked')
    if(checkedCheckboxs.length == 0){
        alert("Пожалуйста, выберете одного студента");
        return;
    }
    if(checkedCheckboxs.length > 1){
        alert("Пожалуйста, выберете только одного студента");
        return;
    }

    var id = checkedCheckboxs[0].value;

    document.getElementById("idHiddenProgress").value = id;
    document.getElementById("progressForm").submit();

}