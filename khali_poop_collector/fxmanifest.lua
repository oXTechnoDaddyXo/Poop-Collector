--[[
    ╔═══════════════════════════════════════════════════════════════════╗
    ║                                                                   ║
    ║           R E D M  P O O P  C O L L E C T O R                     ║
    ║           ────────────────────────────                            ║
    ║            VORP Poop collect as Item                              ║
    ║            Redemption Script                                      ║
    ║                                                                   ║
    ║                                                                   ║
    ║                                                                   ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   Server:    Destiny Flats RP                                     ║
    ║   Creator:   oXTechnoKhaliXo                                      ║
    ║   Discord:   https://discord.gg/djt7QQMkVa                        ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   © 2026 oXTechnoKhaliXo | All Rights Reserved                    ║
    ╚═══════════════════════════════════════════════════════════════════╝
]]
fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'oXTechnoKhaliXo'
description 'A script to collect Animal Poop'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

sql_scripts {
	'items/*.sql'
}

version '1.0'

