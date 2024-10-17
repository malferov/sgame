import discord
import random
from discord_components import DiscordComponents , Button , ButtonStyle
client = discord.Client()

hi = ["пр","hi","привет"]
role = ["1294763309836533812","1294763320552853656","1294763560143949956","1294763627433431091","1294763667434373182","1294763667434373182","1294764165742858314","1294764506660081776","1294767095392768043","1294767339237146757","1294767606020178001","1294767671895785645","1294767739663028378","1294768575982338119"]

@client.event
async def on_ready():
    print("бот готов к работе")
    DiscordComponents(client)
    await client.change_presence(status=discord.Status.do_not_disturb, activity=discord.Game("Terraria"))

def readFile(filename):
    file = open(filename, "r", encoding="UTF-8")
    list = file.read().split("\n")
    file.close()
    return random.choice(list)

@client.event
async def on_message(message):
    guild = message.guild
    author = message.author
    if message.content.startswith("hi"):
        await message.channel.send(readFile("greetings.txt"))
    if message.content.startswith("com"):
        await message.channel.send("привет я бот террарии и могу тебе помочь советами чтобы пройти террарию вот все мои команды: hi = (привет) com = (эта команда) infection = (МИР ОЧЕНЬ БЫСТРО ЗАРАЖАЕТСЯ ПОРЦЕЙ ИЛИ БАГРЯНЦЕМ) BOSS = (выбирает тебе любую роль босса) trash = (удаляет 5 сообщений в чате) trashALL = (удаляет 9999 сообщений в ЧАТЕ) WhereCanBuy = (где можно купить террарию?) inf = (сайты информации о террарии)")
    if message.content.startswith("infection"):
        await message.channel.send("1) до хард мода:поставь около порци или богрянца подсолнух или каменую стену это остоновит их рост в хард моде:убей плантеру это остоновит порцу или богрянец на 25% 2)до хард мода:спомощю бомб зделай огромную ямю без стен до ада  в хард моде: зарази свой мир светы биомам он сможет остоновить порцу или богрянец на ~30%")
    if message.content.startswith("trash"):
        await message.channel.purge(limit=6)
    if message.content.startswith("trashALL"):
        await message.channel.purge(limit=100)
    if message.content.startswith("BOSS"):
        role2 = guild.get_role(int(random.choice(role)))
        await author.add_roles(role2)
    if message.content.startswith("WhereCanBuy"):
        await message.channel.send("террарию можно купить в steam")
    if message.content.startswith("inf"):
        await message.channel.send(embed = discord.Embed(title="о кнпочки"),components=[Button(style=ButtonStyle.green, label="terraria wiki")])
        await message.channel.send(embed = discord.Embed(title="о кнпочки"),components=[Button(style=ButtonStyle.green, label="official site")])
        await message.channel.send(embed = discord.Embed(title="о кнпочки"),components=[Button(style=ButtonStyle.green, label="Official Terraria Wiki")])
@client.event
async def on_button_click(interaction):
    if interaction.responded:
        return
    if interaction.component.label == "terraria wiki":
        await interaction.respond(content = "https://terraria.fandom.com/wiki/Terraria_Wiki")
    elif interaction.component.label == "official site":
        await interaction.respond(content = "https://terraria.org/")
    elif interaction.component.label == "Official Terraria Wiki":
        await interaction.respond(content = "https://terraria.wiki.gg/wiki/Terraria")
    
client.run("<token>")