import { Injectable } from "@angular/core";

import type { FindRecipeDto } from "@/application/dtos/recipe.dto";
import { AuthService } from "@/application/services/auth-service.interface";
import { RecipeRepository } from "@/domain/repositories/recipe-repository.interface";

@Injectable({
  providedIn: "root",
})
export class DeleteRecipeUseCase {
  constructor(
    private readonly authService: AuthService,
    private readonly recipeRepository: RecipeRepository,
  ) {}

  async execute(data: FindRecipeDto): Promise<boolean> {
    const user = this.authService.getCurrentUser();

    if (!user) {
      throw new Error("Unauthorized");
    }

    return this.recipeRepository.delete(data.id);
  }
}