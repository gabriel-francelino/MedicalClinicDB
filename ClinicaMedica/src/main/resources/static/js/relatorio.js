// -------------------------------------------------------------------------- 

// Relatório de Atividade do Médico 

const getEntity = async (type) => {
    const response = await fetch("/api/" + type);
    const json = await response.json();
    return json; 
}

let medicoId;
const getIndex = () => {
    const urlIndex = new URLSearchParams(window.location.search);
    medicoId = parseInt(urlIndex.get('index'));
    if(!medicoId) {
        window.location.assign('../')
    }
}
const loadMedico = async () => {
    const medico = await getEntity(`medicos/${medicoId}`);
    document.querySelector("#nome").innerHTML = `
        ${medico.nome} : ${medico.especialidade}
    `;
}

const getRelatorio = async (type) => {
    const data = await getEntity(type)
    switch(type) {
        case 'consultas':
            return data.filter(consulta => consulta.medico.id == medicoId);
        case 'exames':
            return data.filter(exame => exame.medico.id == medicoId);
        case 'receitas':
            return data.filter(receita => receita.medico.id == medicoId);
        default:
            return [];
    }
    // SELECT * FROM {consultas, exames, receitas} WHERE medico_id = {medicoId};
}
  
const mostrarConsultas = async () => {
    const consultas = await getRelatorio("consultas")
    const divConsultas = document.querySelector("#consultas");

    divConsultas.innerHTML = "";
    consultas.forEach(consulta => {
        divConsultas.innerHTML += `
            <div class="item">
                ${consulta.descricao} : Paciente
                ${consulta.paciente.nome}
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
                ${exame.descricao} : Paciente
                ${exame.paciente.nome}
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
                ${receita.descricao} : Paciente
                ${receita.paciente.nome}
            </div>
        `;
    });
};

// --------------------------------------------------------------------------

// Events

window.onload = () => {
    getIndex();
    loadMedico();
    mostrarConsultas();
    mostrarExames();
    mostrarReceitas();
}

// --------------------------------------------------------------------------