use serde::{Deserialize, Serialize};

use crate::messages::get_all_notes::{BaseError, GetAllNotesOutput, GetAllNotesOutputMessage};

#[derive(Clone, Serialize, Debug, Deserialize)]
pub struct NotaCreditoModel {
    pub codigo_nota_credito: String,
    pub precio: String,
    pub motivo: String,
    pub tipo: String,
    pub factura_codigo: String,
    pub tipo_moneda: String,
    pub precio_neto: String,
    pub forma_pago: String,
    pub guia_remision_transportista: String,
    pub igv: String,
    pub guia_remision_remitente: String,
    pub factura_importe: String,
    pub fecha_emision: String,
    /// Puede ser null en JSON, pero aquí se maneja como string opcional
    pub servicio: String,
    pub cliente_ruc: String,
    pub cliente_nombre: String,
    pub cliente_departamento: String,
    pub cliente_calle: String,
    pub cliente_avenida: String,
    pub cliente_distrito: String,
    pub cliente_ciudad: String,
    pub empresa_nombre: String,
    pub empresa_departamento: String,
    pub empresa_calle: String,
    /// Puede ser null en JSON, pero aquí se maneja como string opcional
    pub empresa_avenida: String,
    pub empresa_distrito: String,
    pub empresa_ciudad: String,
    pub empresa_ruc: String,
    pub rutas: ::prost::alloc::vec::Vec<String>,
    pub observaciones: ::prost::alloc::vec::Vec<String>,
}

impl From<NotaCreditoModel> for GetAllNotesOutput {
    fn from(value: NotaCreditoModel) -> Self {
        Self {
            codigo_nota_credito: value.codigo_nota_credito,
            precio: value.precio,
            motivo: value.motivo,
            tipo: value.tipo,
            factura_codigo: value.factura_codigo,
            tipo_moneda: value.tipo_moneda,
            precio_neto: value.precio_neto,
            forma_pago: value.forma_pago,
            guia_remision_transportista: value.guia_remision_transportista,
            igv: value.igv,
            guia_remision_remitente: value.guia_remision_remitente,
            factura_importe: value.factura_importe,
            fecha_emision: value.fecha_emision,
            servicio: value.servicio,
            cliente_ruc: value.cliente_ruc,
            cliente_nombre: value.cliente_nombre,
            cliente_departamento: value.cliente_departamento,
            cliente_calle: value.cliente_calle,
            cliente_avenida: value.cliente_avenida,
            cliente_distrito: value.cliente_distrito,
            cliente_ciudad: value.cliente_ciudad,
            empresa_nombre: value.empresa_nombre,
            empresa_departamento: value.empresa_departamento,
            empresa_calle: value.empresa_calle,
            empresa_avenida: value.empresa_avenida,
            empresa_distrito: value.empresa_distrito,
            empresa_ciudad: value.empresa_ciudad,
            empresa_ruc: value.empresa_ruc,
            rutas: value.rutas,
            observaciones: value.observaciones,
        }
    }
}



pub enum GetAllNotaCreditoResponse {
    Success(GetAllNotesOutputMessage),
    Error(BaseError),
}