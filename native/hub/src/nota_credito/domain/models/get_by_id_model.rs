use serde::{Deserialize, Serialize};

use crate::messages::{get_all_notes::BaseError, get_by_id::{GetByIdOutput, GetByIdOutputMessage}};

#[derive(Debug, Serialize, Deserialize)]
pub struct GetByIdModel {
    #[serde(rename = "codigoNotaCredito")]
    pub codigo_nota_credito: String,
    #[serde(rename = "precio")]
    pub precio: String,
    #[serde(rename = "motivo")]
    pub motivo: String,
    #[serde(rename = "tipo")]
    pub tipo: String,
    #[serde(rename = "facturaCodigo")]
    pub factura_codigo: String,
    #[serde(rename = "tipoMoneda")]
    pub tipo_moneda: String,
    #[serde(rename = "precioNeto")]
    pub precio_neto: String,
    #[serde(rename = "formaPago")]
    pub forma_pago: String,
    #[serde(rename = "guiaRemisionTransportista")]
    pub guia_remision_transportista: String,
    #[serde(rename = "igv")]
    pub igv: String,
    #[serde(rename = "guiaRemisionRemitente")]
    pub guia_remision_remitente: String,
    #[serde(rename = "facturaImporte")]
    pub factura_importe: String,
    #[serde(rename = "fechaEmision")]
    pub fecha_emision: String,
    #[serde(rename = "servicio")]
    pub servicio: Option<String>, // Opcional para valores nulos
    #[serde(rename = "clienteRuc")]
    pub cliente_ruc: String,
    #[serde(rename = "clienteNombre")]
    pub cliente_nombre: String,
    #[serde(rename = "clienteDepartamento")]
    pub cliente_departamento: String,
    #[serde(rename = "clienteCalle")]
    pub cliente_calle: String,
    #[serde(rename = "clienteAvenida")]
    pub cliente_avenida: Option<String>,
    #[serde(rename = "clienteDistrito")]
    pub cliente_distrito: String,
    #[serde(rename = "clienteCiudad")]
    pub cliente_ciudad: String,
    #[serde(rename = "empresaNombre")]
    pub empresa_nombre: String,
    #[serde(rename = "empresaDepartamento")]
    pub empresa_departamento: String,
    #[serde(rename = "empresaCalle")]
    pub empresa_calle: String,
    #[serde(rename = "empresaAvenida")]
    pub empresa_avenida: Option<String>, // Opcional para valores nulos
    #[serde(rename = "empresaDistrito")]
    pub empresa_distrito: String,
    #[serde(rename = "empresaCiudad")]
    pub empresa_ciudad: String,
    #[serde(rename = "empresaRuc")]
    pub empresa_ruc: String,
    #[serde(rename = "rutas")]
    pub rutas: Vec<String>,
    #[serde(rename = "observaciones")]
    pub observaciones: Vec<String>,
}

impl From<GetByIdModel> for GetByIdOutput {
    fn from(value: GetByIdModel) -> Self {
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
            servicio: value.servicio.unwrap_or("".to_string()),
            cliente_ruc: value.cliente_ruc,
            cliente_nombre: value.cliente_nombre,
            cliente_departamento: value.cliente_departamento,
            cliente_calle: value.cliente_calle,
            cliente_avenida: value.cliente_avenida.unwrap_or("".to_string()),
            cliente_distrito: value.cliente_distrito,
            cliente_ciudad: value.cliente_ciudad,
            empresa_nombre: value.empresa_nombre,
            empresa_departamento: value.empresa_departamento,
            empresa_calle: value.empresa_calle,
            empresa_avenida: value.empresa_avenida.unwrap_or("".to_string()),
            empresa_distrito: value.empresa_distrito,
            empresa_ciudad: value.empresa_ciudad,
            empresa_ruc: value.empresa_ruc,
            rutas: value.rutas,
            observaciones: value.observaciones,
        }
    }
}

pub enum GetOneNotaCreditoResponse {
    Success(GetByIdOutputMessage),
    Error(BaseError),
}
