// -------------------------------------------------------------------------- 

// API Entity CRUD

const getEntity = async (type) => {
    const response = await fetch("/api/" + type);
    const json = await response.json();
    return json; 
}
const createEntity = async (type, entity) => {
    const response = await fetch(`/api/${type}`, {
        method: "POST",
        headers: { "Content-Type": "application/json"},
        body: JSON.stringify(entity)
    });
    if (response.ok) {
        console.log("Created successfully");
    } else {
        console.error("Failed to create");
    }
    return await response.json();
}
const updateEntity = async (id, entity, type) => {
    const response = await fetch(`/api/${type}/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json"},
        body: JSON.stringify(entity)
    });
    if (response.ok) {
        console.log("Updated successfully");
    } else {
        console.error("Failed to update");
    }
    return await response.json();
}
const deleteEntity = async (id, type) => {
    const response = await fetch(`/api/${type}/${id}`, {
        method: "DELETE"
    });
    if (response.ok) {
        console.log("Deleted successfully");
    } else {
        console.error("Failed to delete");
    }
}

// --------------------------------------------------------------------------

// Modals

let confirmModal;
const modalContent = document.querySelector('.modalContainer .modalContent');
const btnCloseModal = document.querySelector("#btnCloseModal");
const btnConfirmModal = document.querySelector("#btnConfirmModal");

const openModal = () => {
    document.querySelector(".modal").classList.add("active");
    document.querySelector(".modalContainer").classList.add("active");
}
const closeModal = () => {
    document.querySelector(".modal").classList.remove("active");
    document.querySelector(".modalContainer").classList.remove("active");
}

// --------------------------------------------------------------------------

// Pacientes

const listaPacientes = document.querySelector(".pacientes .list");

const loadPacientes = async () => {
    listaPacientes.innerHTML = "";
    const pacientes = await getEntity('pacientes');
    for(let i = 0; i < pacientes.length; i++) {
        listaPacientes.innerHTML += `
            <div class="item">
                ${pacientes[i].nome}
                <div class="options">
                    <button type="button" class="openButton" onclick="modalEditarPaciente(${pacientes[i].id})"><i class='bx bxs-pencil'></i></button>
                    <button type="button" class="openButton"><i class='bx bxs-trash'></i></button>
                </div>
            </div>
        `;
    }
}
const novoPaciente = async () => {
    const nome = document.querySelector("#nome").value;
    const dataNascimento = document.querySelector("#dataNascimento").value;
    const endereco = document.querySelector("#endereco").value;
    const telefone = document.querySelector("#telefone").value;
    const paciente = {
        nome: nome,
        dataNascimento: dataNascimento,
        endereco: endereco,
        telefone: telefone
    };

    console.log(await createEntity("pacientes", paciente));
    await loadPacientes()
    closeModal();
}
const modalPacientes = () => {
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="text" id="nome" placeholder="Nome" autocomplete="off" name="nome">
                <label for="nome">Nome</label>
            </div>
            <div class="inputField">
                <input type="date" id="dataNascimento" name="dataNascimento">
                <label for="dataNascimento">Data de Nascimento</label>
            </div>
            <div class="inputField">
                <input type="text" id="endereco" placeholder="Endereço" autocomplete="off" name="endereco">
                <label for="endereco">Endereço</label>
            </div>
            <div class="inputField">
                <input type="text" id="telefone" placeholder="Telefone" autocomplete="off" name="telefone">
                <label for="telefone">Telefone</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    confirmModal = novoPaciente;
    btnConfirmModal.addEventListener('click', confirmModal);
}
const editarPaciente = async (id) => {
    const nome = document.querySelector("#nome").value;
    const dataNascimento = document.querySelector("#dataNascimento").value;
    const endereco = document.querySelector("#endereco").value;
    const telefone = document.querySelector("#telefone").value;
    const paciente = {
        nome: nome,
        dataNascimento: dataNascimento,
        endereco: endereco,
        telefone: telefone
    };
    console.log(await updateEntity(id, paciente, "pacientes"));
    await loadPacientes()
    closeModal();
}
const modalEditarPaciente = async (id) => {
    const paciente = await getEntity(`pacientes/${id}`);
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="text" id="nome" placeholder="Nome" autocomplete="off" name="nome" value="${paciente.nome}">
                <label for="nome">Nome</label>
            </div>
            <div class="inputField">
                <input type="date" id="dataNascimento" name="dataNascimento" value="${paciente.dataNascimento}">
                <label for="dataNascimento">Data de Nascimento</label>
            </div>
            <div class="inputField">
                <input type="text" id="endereco" placeholder="Endereço" autocomplete="off" name="endereco" value="${paciente.endereco}">
                <label for="endereco">Endereço</label>
            </div>
            <div class="inputField">
                <input type="text" id="telefone" placeholder="Telefone" autocomplete="off" name="telefone" value="${paciente.telefone}">
                <label for="telefone">Telefone</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    btnConfirmModal.setAttribute("onclick", `editarPaciente(${paciente.id})`);
}

document.querySelector("#criarPaciente").addEventListener("click", modalPacientes);

// --------------------------------------------------------------------------

// Medicos

const listaMedicos = document.querySelector(".medicos .list");

const loadMedicos = async () => {
    listaMedicos.innerHTML = "";
    const medicos = await getEntity('medicos');
    for(let i = 0; i < medicos.length; i++) {
        listaMedicos.innerHTML += `
            <div class="item">
                ${medicos[i].nome}
                <div class="options">
                    <button type="button" class="openButton" onclick="modalEditarMedico(${medicos[i].id})"><i class='bx bxs-pencil'></i></button>
                    <button type="button" class="openButton"><i class='bx bxs-trash'></i></button>
                </div>
            </div>
        `;
    }
}
const novoMedico = async () => {
    const nome = document.querySelector("#nome").value;
    const especialidade = document.querySelector("#especialidade").value;
    const horarioInicio = document.querySelector("#horaInicio").value;
    const horarioFim = document.querySelector("#horaFim").value;
    const medico = {
        nome: nome,
        especialidade: especialidade,
        horarioInicio: horarioInicio + ":00",
        horarioFim: horarioFim + ":00"
    };

    console.log(await createEntity("medicos", medico));
    await loadMedicos()
    closeModal();
}
const modalMedicos = () => {
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="text" id="nome" placeholder="Nome" autocomplete="off" name="nome">
                <label for="nome">Nome</label>
            </div>
            <div class="inputField">
                <input type="text" id="especialidade" placeholder="Especialidade" autocomplete="off" name="especialidade">
                <label for="especialidade">Especialidade</label>
            </div>
            <div class="inputField">
                <input type="time" id="horaInicio" placeholder="Horário Início" name="horarioInicio">
                <label for="horaInicio">Horário Início</label>
            </div>
            <div class="inputField">
                <input type="time" id="horaFim" placeholder="Horário Fim" name="horarioFim">
                <label for="horaFim">Horário Fim</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    confirmModal = novoMedico;
    btnConfirmModal.addEventListener('click', confirmModal);
}
const editarMedico = async (id) => {
    const nome = document.querySelector("#nome").value;
    const especialidade = document.querySelector("#especialidade").value;
    const horarioInicio = document.querySelector("#horaInicio").value;
    const horarioFim = document.querySelector("#horaFim").value;
    const medico = {
        nome: nome,
        especialidade: especialidade,
        horarioInicio: horarioInicio,
        horarioFim: horarioFim
    };

    console.log(await updateEntity(id, medico, "medicos"));
    await loadMedicos()
    closeModal();
}
const modalEditarMedico = async (id) => {
    const medico = await getEntity(`medicos/${id}`);
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="text" id="nome" placeholder="Nome" autocomplete="off" name="nome" value="${medico.nome}">
                <label for="nome">Nome</label>
            </div>
            <div class="inputField">
                <input type="text" id="especialidade" placeholder="Especialidade" autocomplete="off" name="especialidade" value="${medico.especialidade}">
                <label for="especialidade">Especialidade</label>
            </div>
            <div class="inputField">
                <input type="time" id="horaInicio" placeholder="Horário Início" name="horarioInicio" value="${medico.horarioInicio}">
                <label for="horaInicio">Horário Início</label>
            </div>
            <div class="inputField">
                <input type="time" id="horaFim" placeholder="Horário Fim" name="horarioFim" value="${medico.horarioFim}">
                <label for="horaFim">Horário Fim</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    btnConfirmModal.setAttribute("onclick", `editarMedico(${medico.id})`);
}

document.querySelector("#criarMedico").addEventListener("click", modalMedicos);

// --------------------------------------------------------------------------

// Consultas

const listaConsultas = document.querySelector(".consultas .list");

const loadConsultas = async () => {
    listaConsultas.innerHTML = "";
    const consultas = await getEntity('consultas');
    for(let i = 0; i < consultas.length; i++) {
        listaConsultas.innerHTML += `
            <div class="item">
                ${consultas[i].descricao}
                <div class="options">
                    <button type="button" class="openButton" onclick="modalEditarConsulta(${i})"><i class='bx bxs-pencil'></i></button>
                    <button type="button" class="openButton"><i class='bx bxs-trash'></i></button>
                </div>
            </div>
        `;
    }
}
const novaConsulta = async () => {
    const dataHora = document.querySelector("#dataHora").value;
    const descricao = document.querySelector("#descricao").value;
    const pacienteId = document.querySelector("#pacienteId").value;
    const medicoId = document.querySelector("#medicoId").value;

    const paciente = await getEntity(`pacientes/${pacienteId}`);
    const medico = await getEntity(`medicos/${medicoId}`);

    if(paciente == null || medico == null) {
        console.log("Médico ou paciente não existem.");
        return;
    }

    const consulta = {
        dataHora: dataHora,
        descricao: descricao,
        paciente: paciente,
        medico: medico
    };

    console.log(await createEntity("consultas", consulta));
    await loadConsultas()
    closeModal();
}
const modalConsulta = async () => {
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="datetime-local" id="dataHora" placeholder="Data e Hora" autocomplete="off" name="dataHora">
                <label for="dataHora">Data e Hora</label>
            </div>
            <div class="inputField">
                <input type="text" id="descricao" placeholder="Descrição" autocomplete="off" name="descricao">
                <label for="descricao">Descrição</label>
            </div>
            <div class="inputField">
                <input type="number" id="pacienteId" placeholder="ID do Paciente" name="pacienteId">
                <label for="pacienteId">Id do Paciente</label>
            </div>
            <div class="inputField">
                <input type="number" id="medicoId" placeholder="ID do Médico" name="medicoId">
                <label for="medicoId">Id do Médico</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    confirmModal = novaConsulta;
    btnConfirmModal.addEventListener('click', confirmModal);
}
const editarConsulta = async (id) => {
    const dataHora = document.querySelector("#dataHora").value;
    const descricao = document.querySelector("#descricao").value;
    const pacienteId = document.querySelector("#pacienteId").value;
    const medicoId = document.querySelector("#medicoId").value;

    const paciente = await getEntity(`pacientes/${pacienteId}`);
    const medico = await getEntity(`medicos/${medicoId}`);

    if(paciente == null || medico == null) {
        console.log("Médico ou paciente não existem.");
        return;
    }
    const consulta = {
        dataHora: dataHora,
        descricao: descricao,
        paciente: paciente,
        medico: medico
    };

    console.log(await updateEntity(id, consulta, "consultas"));
    await loadConsultas()
    closeModal();
}
const modalEditarConsulta = async (index) => {
    const consultas = await getEntity(`consultas`);
    const consulta = await consultas[index];
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="datetime-local" id="dataHora" placeholder="Data e Hora" autocomplete="off" name="dataHora" value="${consulta.dataHora}">
                <label for="dataHora">Data e Hora</label>
            </div>
            <div class="inputField">
                <input type="text" id="descricao" placeholder="Descrição" autocomplete="off" name="descricao" value="${consulta.descricao}">
                <label for="descricao">Descrição</label>
            </div>
            <div class="inputField">
                <input type="number" id="pacienteId" placeholder="ID do Paciente" name="pacienteId" value="${consulta.paciente.id}">
                <label for="pacienteId">Id do Paciente</label>
            </div>
            <div class="inputField">
                <input type="number" id="medicoId" placeholder="ID do Médico" name="medicoId" value="${consulta.medico.id}">
                <label for="medicoId">Id do Médico</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    btnConfirmModal.setAttribute("onclick", `editarConsulta(${consulta.id})`);
}

document.querySelector("#criarConsulta").addEventListener("click", modalConsulta);

// --------------------------------------------------------------------------

// Exames

const listaExames = document.querySelector(".exames .list");

const loadExames = async () => {
    listaExames.innerHTML = "";
    const exames = await getEntity('exames');
    for(let i = 0; i < exames.length; i++) {
        listaExames.innerHTML += `
            <div class="item">
                ${exames[i].descricao}
                <div class="options">
                    <button type="button" class="openButton" onclick="modalEditarExame(${i})"><i class='bx bxs-pencil'></i></button>
                    <button type="button" class="openButton"><i class='bx bxs-trash'></i></button>
                </div>
            </div>
        `;
    }
}
const novoExame = async () => {
    const data = document.querySelector("#data").value;
    const descricao = document.querySelector("#descricao").value;
    const resultados = document.querySelector("#resultados").value;
    const pacienteId = document.querySelector("#pacienteId").value;
    const medicoId = document.querySelector("#medicoId").value;

    const paciente = await getEntity(`pacientes/${pacienteId}`);
    const medico = await getEntity(`medicos/${medicoId}`);

    if(paciente == null || medico == null) {
        console.log("Médico ou paciente não existem.");
        return;
    }

    const exame = {
        data: data,
        descricao: descricao,
        resultados: resultados,
        paciente: paciente,
        medico: medico
    };

    console.log(await createEntity("exames", exame));
    await loadExames()
    closeModal();
}
const modalExame = async () => {
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="date" id="data" placeholder="Data" name="data">
                <label for="data">Data</label>
            </div>
            <div class="inputField">
                <input type="text" id="descricao" placeholder="Descrição" autocomplete="off" name="descricao">
                <label for="descricao">Descrição</label>
            </div>
            <div class="inputField">
                <input type="text" id="resultados" placeholder="Resultados" autocomplete="off" name="resultados">
                <label for="resultados">Resultados</label>
            </div>
            <div class="inputField">
                <input type="number" id="pacienteId" placeholder="ID do Paciente" name="pacienteId">
                <label for="pacienteId">Id do Paciente</label>
            </div>
            <div class="inputField">
                <input type="number" id="medicoId" placeholder="ID do Médico" name="medicoId">
                <label for="medicoId">Id do Médico</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    confirmModal = novoExame;
    btnConfirmModal.addEventListener('click', confirmModal);
}
const editarExame = async (id) => {
    const data = document.querySelector("#data").value;
    const descricao = document.querySelector("#descricao").value;
    const resultados = document.querySelector("#resultados").value;
    const pacienteId = document.querySelector("#pacienteId").value;
    const medicoId = document.querySelector("#medicoId").value;

    const paciente = await getEntity(`pacientes/${pacienteId}`);
    const medico = await getEntity(`medicos/${medicoId}`);

    if(paciente == null || medico == null) {
        console.log("Médico ou paciente não existem.");
        return;
    }
    const exame = {
        data: data,
        descricao: descricao,
        resultados: resultados,
        paciente: paciente,
        medico: medico
    };

    console.log(await updateEntity(id, exame, "exames"));
    await loadExames()
    closeModal();
}
const modalEditarExame = async (index) => {
    const exames = await getEntity(`exames`);
    const exame = await exames[index];
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="date" id="data" placeholder="Data" name="data" value="${exame.data}">
                <label for="data">Data</label>
            </div>
            <div class="inputField">
                <input type="text" id="descricao" placeholder="Descrição" autocomplete="off" name="descricao" value="${exame.descricao}">
                <label for="descricao">Descrição</label>
            </div>
            <div class="inputField">
                <input type="text" id="resultados" placeholder="Resultados" autocomplete="off" name="resultados" value="${exame.resultados}">
                <label for="resultados">Resultados</label>
            </div>
            <div class="inputField">
                <input type="number" id="pacienteId" placeholder="ID do Paciente" name="pacienteId" value="${exame.paciente.id}">
                <label for="pacienteId">Id do Paciente</label>
            </div>
            <div class="inputField">
                <input type="number" id="medicoId" placeholder="ID do Médico" name="medicoId" value="${exame.medico.id}">
                <label for="medicoId">Id do Médico</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    btnConfirmModal.setAttribute("onclick", `editarExame(${exame.id})`);
}

document.querySelector("#criarExame").addEventListener("click", modalExame);

// --------------------------------------------------------------------------

// Receitas

const listaReceitas = document.querySelector(".receitas .list");

const loadReceitas = async () => {
    listaReceitas.innerHTML = "";
    const receitas = await getEntity('receitas');
    for(let i = 0; i < receitas.length; i++) {
        listaReceitas.innerHTML += `
            <div class="item">
                ${receitas[i].descricao}
                <div class="options">
                    <button type="button" class="openButton" onclick="modalEditarReceita(${i})"><i class='bx bxs-pencil'></i></button>
                    <button type="button" class="openButton"><i class='bx bxs-trash'></i></button>
                </div>
            </div>
        `;
    }
}
const novaReceita = async () => {
    const data = document.querySelector("#data").value;
    const descricao = document.querySelector("#descricao").value;
    const medicamentos = document.querySelector("#medicamentos").value;
    const pacienteId = document.querySelector("#pacienteId").value;
    const medicoId = document.querySelector("#medicoId").value;

    const paciente = await getEntity(`pacientes/${pacienteId}`);
    const medico = await getEntity(`medicos/${medicoId}`);

    if(paciente == null || medico == null) {
        console.log("Médico ou paciente não existem.");
        return;
    }

    const receita = {
        data: data,
        descricao: descricao,
        medicamentos: medicamentos,
        paciente: paciente,
        medico: medico
    };

    console.log(await createEntity("receitas", receita));
    await loadReceitas()
    closeModal();
}
const modalReceita = async () => {
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="date" id="data" placeholder="Data" name="data">
                <label for="data">Data</label>
            </div>
            <div class="inputField">
                <input type="text" id="descricao" placeholder="Descrição" autocomplete="off" name="descricao">
                <label for="descricao">Descrição</label>
            </div>
            <div class="inputField">
                <input type="text" id="medicamentos" placeholder="Medicamentos" autocomplete="off" name="medicamentos">
                <label for="medicamentos">Medicamentos</label>
            </div>
            <div class="inputField">
                <input type="number" id="pacienteId" placeholder="ID do Paciente" name="pacienteId">
                <label for="pacienteId">Id do Paciente</label>
            </div>
            <div class="inputField">
                <input type="number" id="medicoId" placeholder="ID do Médico" name="medicoId">
                <label for="medicoId">Id do Médico</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    confirmModal = novaReceita;
    btnConfirmModal.addEventListener('click', confirmModal);
}
const editarReceita = async (id) => {
    const data = document.querySelector("#data").value;
    const descricao = document.querySelector("#descricao").value;
    const medicamentos = document.querySelector("#medicamentos").value;
    const pacienteId = document.querySelector("#pacienteId").value;
    const medicoId = document.querySelector("#medicoId").value;

    const paciente = await getEntity(`pacientes/${pacienteId}`);
    const medico = await getEntity(`medicos/${medicoId}`);

    if(paciente == null || medico == null) {
        console.log("Médico ou paciente não existem.");
        return;
    }

    const receita = {
        data: data,
        descricao: descricao,
        medicamentos: medicamentos,
        paciente: paciente,
        medico: medico
    };

    console.log(await updateEntity(id, receita, "receitas"));
    await loadReceitas()
    closeModal();
}
const modalEditarReceita = async (index) => {
    const receitas = await getEntity(`receitas`);
    const receita = await receitas[index];
    openModal();
    modalContent.innerHTML = `
        <form>
            <div class="inputField">
                <input type="date" id="data" placeholder="Data" name="data" value="${receita.data}">
                <label for="data">Data</label>
            </div>
            <div class="inputField">
                <input type="text" id="descricao" placeholder="Descrição" autocomplete="off" name="descricao" value="${receita.descricao}">
                <label for="descricao">Descrição</label>
            </div>
            <div class="inputField">
                <input type="text" id="medicamentos" placeholder="Medicamentos" autocomplete="off" name="medicamentos" value="${receita.medicamentos}">
                <label for="medicamentos">Medicamentos</label>
            </div>
            <div class="inputField">
                <input type="number" id="pacienteId" placeholder="ID do Paciente" name="pacienteId" value="${receita.paciente.id}">
                <label for="pacienteId">Id do Paciente</label>
            </div>
            <div class="inputField">
                <input type="number" id="medicoId" placeholder="ID do Médico" name="medicoId" value="${receita.medico.id}">
                <label for="medicoId">Id do Médico</label>
            </div>
        </form>
    `;
    btnConfirmModal.removeEventListener('click', confirmModal);
    btnConfirmModal.removeAttribute("onclick");
    btnConfirmModal.setAttribute("onclick", `editarReceita(${receita.id})`);
}

document.querySelector("#criarReceita").addEventListener("click", modalReceita);

// --------------------------------------------------------------------------

// Events

window.onload = () => {
    loadPacientes();
    loadMedicos();
    loadConsultas();
    loadExames();
    loadReceitas();
}
btnCloseModal.addEventListener("click", closeModal);

// --------------------------------------------------------------------------