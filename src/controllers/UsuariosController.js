import { Router } from 'express';
import usuarioServices from '../services/usuario-services.js'
const usuarioRouter = Router();


usuarioRouter.post('', async (req, res) => {
    try {
        const usuarioData = req.body.usuario;
        if (usuarioData.fkRol == 1) {
            const empresaData = { Id: usuarioData.CodigoEmpresa, Nombre: usuarioData.Nombre, Cuit: usuarioData.Cuit };
            const resultEmpresa = await usuarioServices.insertEmpresa(empresaData)
            if (resultEmpresa == false) {
                res.status(400).json({ message: "Error" });
            }
        }
        const resultUsuario = await usuarioServices.insertUsuario(usuarioData)
        if (resultUsuario == false) {
            await usuarioServices.deleteEmpresa(empresaData.Id)
            res.status(401).json({ message: "Error, usuario ya existente" });
        } else {

            res.status(201).json({ message: "Usuario registrado correctamente!" });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'insert failed' });
    }
});

usuarioRouter.put('/:idUsuario', async (req, res) => {
    try {
        await usuarioServices.updateUsuario(req.body)
        res.status(200).json({ message: 'user updated' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'update failed' });
    }
});

usuarioRouter.get('/getById/:id', async (req, res) => {
    const usuario = await usuarioServices.getUsuarioById(req.params.id)
    return res.status(200).json(usuario);
});

usuarioRouter.post('/login', async (req, res) => {
    const usuario = await usuarioServices.getUsuarioByMailYContra(req.body.mail, req.body.pass)
    if (!usuario) {
        res.status(401).json({ message: "Usuario no encontrado" });
    }
    else {
        return res.status(200).json(usuario);
    }

});

usuarioRouter.get('/getByEmpresa/:fkEmpresa', async(req, res) => {
    const usuario = await usuarioServices.getAllVendedores(req.params.fkEmpresa);
    console.log(res);
    return res.status(200).json(usuario);
});

usuarioRouter.delete('/:id', async (req, res) => {
    const rowsAffected = await usuarioServices.deleteUsuario(req.params.id);
    if (rowsAffected > 0) {
        res.status(200).json({ message: 'user deleted' });
    } else if (rowsAffected === 0) {
        res.status(404).json({ error: 'not found' });
    }
    else res.status(500).json({ error: 'server error' });
})

usuarioRouter.get('/:nombreEmpresa', async (req, res) => {
    const usuarios = await usuarioServices.getAllVendedores(req.params.nombreEmpresa);
    console.log(req.params.nombreEmpresa);
    return res.status(200).json(usuarios);
});

export default usuarioRouter;