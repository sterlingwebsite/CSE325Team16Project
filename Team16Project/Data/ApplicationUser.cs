using Microsoft.AspNetCore.Identity;

namespace Team16Project.Data;

public class ApplicationUser : IdentityUser
{
    // Shown on the user profile card.
    public string? Bio { get; set; }
}