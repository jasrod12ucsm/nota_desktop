use core::fmt;

#[derive(Debug)]
pub enum ErrorHeader {
    Reqwest(reqwest::Error),
    Serde(serde_json::Error),
    InvalidHeaderValue(String),
    
}

impl fmt::Display for ErrorHeader {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            ErrorHeader::Reqwest(err) => write!(f, "Request error: {}", err),
            ErrorHeader::Serde(err) => write!(f, "Serialization error: {}", err),
            ErrorHeader::InvalidHeaderValue(err) => write!(f, "Invalid header value: {}", err),
        }
    }
}

impl std::error::Error for ErrorHeader {}

impl From<reqwest::Error> for ErrorHeader {
    fn from(err: reqwest::Error) -> ErrorHeader {
        ErrorHeader::Reqwest(err)
    }
}

impl From<serde_json::Error> for ErrorHeader {
    fn from(err: serde_json::Error) -> ErrorHeader {
        ErrorHeader::Serde(err)
    }
}