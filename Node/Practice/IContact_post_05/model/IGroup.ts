export interface IGroup {
    id: number;
    email: string;
    username: string;
    password: string;
    name: Name;
    address: Address;
    phone: string;
}

export interface Name {
    firstname: string;
    lastname: string;
}

export interface Address {
    city: string;
    street: string;
    number: number;
    zipcode: string;
    geolocation: Geolocation;
}

export interface Geolocation {
    lat: number;
    long: number
}