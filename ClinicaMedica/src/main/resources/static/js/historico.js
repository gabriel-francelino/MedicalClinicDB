// -------------------------------------------------------------------------- 

// Histórico Médico do Paciente

const getEntity = async (type) => {
    const response = await fetch("/api/" + type);
    const json = await response.json();
    return json; 
}

let pacienteId;
const getIndex = () => {
    const urlIndex = new URLSearchParams(window.location.search);
    pacienteId = parseInt(urlIndex.get('index'));
    if(!pacienteId) {
        window.location.assign('../')
    }
}
const loadPaciente = async () => {
    const paciente = await getEntity(`pacientes/${pacienteId}`);
    document.querySelector("#nome").innerHTML = `
        ${paciente.nome}
    `;
}

const getRelatorio = async (type) => {
    const data = await getEntity(type)
    switch(type) {
        case 'consultas':
            return data.filter(consulta => consulta.paciente.id == pacienteId);
        case 'exames':
            return data.filter(exame => exame.paciente.id == pacienteId);
        case 'receitas':
            return data.filter(receita => receita.paciente.id == pacienteId);
        default:
            return [];
        // SELECT * FROM {consultas, exames, receitas} WHERE paciente_id = {pacienteId};
    }
}
  
const mostrarConsultas = async () => {
    const consultas = await getRelatorio("consultas")
    const divConsultas = document.querySelector("#consultas");

    divConsultas.innerHTML = "";
    consultas.forEach(consulta => {
        divConsultas.innerHTML += `
            <div class="item">
                ${consulta.descricao} : Médico(a)
                ${consulta.medico.nome}
            </div>
        `;
    });
};

const mostrarExames = async () => {
    const exames = await getRelatorio("exames")
    const divExames = document.querySelector("#exames");

    divExames.innerHTML = "";
    exames.forEach(exame => {
        divExames.innerHTML += `
            <div class="item">
                ${exame.descricao} : Médico(a)
                ${exame.medico.nome}
            </div>
        `;
    });
};

const mostrarReceitas = async () => {
    const receitas = await getRelatorio("receitas");
    console.log(receitas);
    const divReceitas = document.querySelector("#receitas");

    divReceitas.innerHTML = "";
    receitas.forEach(receita => {
        divReceitas.innerHTML += `
            <div class="item">
                ${receita.descricao} : Médico(a)
                ${receita.medico.nome}
            </div>
        `;
    });
};

// --------------------------------------------------------------------------

// Events

window.onload = () => {
    getIndex();
    loadPaciente();
    mostrarConsultas();
    mostrarExames();
    mostrarReceitas();
}

// --------------------------------------------------------------------------