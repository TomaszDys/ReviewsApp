namespace TomaszDyskoLab5Zad1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Addingstars : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Games",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 31),
                        Producer = c.String(nullable: false, maxLength: 31),
                        Year = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Reviews",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        GameId = c.Int(nullable: false),
                        Title = c.String(nullable: false, maxLength: 50),
                        Description = c.String(nullable: false, unicode: false, storeType: "text"),
                        Stars = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Games", t => t.GameId)
                .Index(t => t.GameId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Reviews", "GameId", "dbo.Games");
            DropIndex("dbo.Reviews", new[] { "GameId" });
            DropTable("dbo.Reviews");
            DropTable("dbo.Games");
        }
    }
}
