export interface IBooks {
    title: string;
    isbn: number;
    downloadable: boolean;
    no_of_reviews: number;
    tags: [];
    languages: [];
    author: Author;

}

export interface Author {
    name: string;
    callname: string;
    profile: Profile;
}

export interface Profile {
    exp: number;
    courses: number;
    books: number;
}
