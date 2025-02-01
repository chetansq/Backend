export interface IRecipes {
    id: number;
    name: string;
    ingredients: [];
    instructions: [];
    prepTimeMinutes: number;
    cookTimeMinutes: number;
    servings: number;
    difficulty: string;
    cuisine: string;
    caloriesPreServing: number;
    tags: [];
    userId: number;
    image: string;
    rating: number;
    reviewCount: number;
    mealType: [];
};