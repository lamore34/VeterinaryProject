export interface IPets {
    id: number;
    name: string;
    age: number;
    weight: string;                                                                                                         
    vaccines: boolean;
    gender: string;
    microChip: boolean;
    codeMicroChip: string;
    observations: string;
    breed: IBreed;
    typePet: ITypePet;
}

export interface IBreed {
    id: number;
    description: string;
}
export interface ITypePet {
    id: number;
    description: string;
}