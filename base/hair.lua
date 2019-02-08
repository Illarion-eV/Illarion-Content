--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local globalvar = require("base.globalvar")

local M = {}


M.hairStyles = {}
--hairStyles[race ID][gender ID][hair ID]

    M.hairStyles[globalvar.raceHUMAN] = {}
        M.hairStyles[globalvar.raceHUMAN][Character.male] = {}
            M.hairStyles[globalvar.raceHUMAN][Character.male][0] = {nameDe="Glatze", nameEn="bald head"}
            M.hairStyles[globalvar.raceHUMAN][Character.male][1] = {nameDe="kurze Haare", nameEn="short hair"}
            M.hairStyles[globalvar.raceHUMAN][Character.male][2] = {nameDe="mittellange Haare", nameEn="medium length hair"}
            M.hairStyles[globalvar.raceHUMAN][Character.male][3] = {nameDe="lange Haare", nameEn="long hair"}
        M.hairStyles[globalvar.raceHUMAN][Character.female] = {}
            M.hairStyles[globalvar.raceHUMAN][Character.female][0] = {nameDe="Glatze", nameEn="bald head"}
            M.hairStyles[globalvar.raceHUMAN][Character.female][1] = {nameDe="mittellange Haare", nameEn="medium length hair"}
            M.hairStyles[globalvar.raceHUMAN][Character.female][4] = {nameDe="hochgesteckte Haare", nameEn="pinned up hair"}
            M.hairStyles[globalvar.raceHUMAN][Character.female][7] = {nameDe="lange, offene Haare", nameEn="long open hair"}
            M.hairStyles[globalvar.raceHUMAN][Character.female][8] = {nameDe="lange Zöpfe", nameEn="long braided hair"}

    M.hairStyles[globalvar.raceDWARF] = {}
        M.hairStyles[globalvar.raceDWARF][Character.male] = {}
            M.hairStyles[globalvar.raceDWARF][Character.male][0] = {nameDe="Glatze", nameEn="bald head"}
            M.hairStyles[globalvar.raceDWARF][Character.male][1] = {nameDe="kurze Haare", nameEn="short hair"}
            M.hairStyles[globalvar.raceDWARF][Character.male][2] = {nameDe="lange Haare (1)", nameEn="long hair (1)"}
            M.hairStyles[globalvar.raceDWARF][Character.male][3] = {nameDe="lange Haare (2)", nameEn="long hair (2)"}
        M.hairStyles[globalvar.raceDWARF][Character.female] = {}
            M.hairStyles[globalvar.raceDWARF][Character.female][0] = {nameDe="Glatze", nameEn="bald head"}
            M.hairStyles[globalvar.raceDWARF][Character.female][1] = {nameDe="Zöpfe", nameEn="braided hair"}
            M.hairStyles[globalvar.raceDWARF][Character.female][4] = {nameDe="hochgesteckte Haare", nameEn="pinned up hair"}
            M.hairStyles[globalvar.raceDWARF][Character.female][7] = {nameDe="lange, offene Haare", nameEn="long open hair"}
            M.hairStyles[globalvar.raceDWARF][Character.female][9] = {nameDe="Pferdeschwanz", nameEn="ponytail"}

    M.hairStyles[globalvar.raceHALFLING] = {}
        M.hairStyles[globalvar.raceHALFLING][Character.male] = {}
            M.hairStyles[globalvar.raceHALFLING][Character.male][1] = {nameDe="kurze Haare", nameEn="short hair"}
            M.hairStyles[globalvar.raceHALFLING][Character.male][2] = {nameDe="mittellange Haare", nameEn="medium length hair"}
        M.hairStyles[globalvar.raceHALFLING][Character.female] = {}
            M.hairStyles[globalvar.raceHALFLING][Character.female][1] = {nameDe="mittellange, glatte Haare", nameEn="medium length hair"}
            M.hairStyles[globalvar.raceHALFLING][Character.female][2] = {nameDe="mittellange, buschige Haare", nameEn="medium bushy hair"}
            M.hairStyles[globalvar.raceHALFLING][Character.female][4] = {nameDe="hochgesteckte Haare", nameEn="pinned up hair"}
            M.hairStyles[globalvar.raceHALFLING][Character.female][9] = {nameDe="Pferdeschwanz", nameEn="ponytail"}

    M.hairStyles[globalvar.raceELF] = {}
        M.hairStyles[globalvar.raceELF][Character.male] = {}
            M.hairStyles[globalvar.raceELF][Character.male][1] = {nameDe="kurze Haare", nameEn="short hair"}
            M.hairStyles[globalvar.raceELF][Character.male][2] = {nameDe="mittellange Haare", nameEn="medium length hair"}
        M.hairStyles[globalvar.raceELF][Character.female] = {}
            M.hairStyles[globalvar.raceELF][Character.female][0] = {nameDe="Glatze", nameEn="bald head"}
            M.hairStyles[globalvar.raceELF][Character.female][1] = {nameDe="mittellange Haare", nameEn="medium length hair"}
            M.hairStyles[globalvar.raceELF][Character.female][4] = {nameDe="hochgesteckte Haare", nameEn="pinned up hair"}
            M.hairStyles[globalvar.raceELF][Character.female][7] = {nameDe="lange, offene Haare", nameEn="long open hair"}
            M.hairStyles[globalvar.raceELF][Character.female][8] = {nameDe="Pferdeschwanz", nameEn="ponytail"}

    M.hairStyles[globalvar.raceORC] = {}
        M.hairStyles[globalvar.raceORC][Character.male] = {}
            M.hairStyles[globalvar.raceORC][Character.male][0] = {nameDe="Glatze", nameEn="bald head"}
            M.hairStyles[globalvar.raceORC][Character.male][1] = {nameDe="kurze Haare", nameEn="short hair"}
            M.hairStyles[globalvar.raceORC][Character.male][2] = {nameDe="Pferdeschwanz", nameEn="ponytail"}
            M.hairStyles[globalvar.raceORC][Character.male][3] = {nameDe="großes Gewusel", nameEn="mery messy hair"}
            M.hairStyles[globalvar.raceORC][Character.male][4] = {nameDe="Gewusel", nameEn="messy hair"}
            M.hairStyles[globalvar.raceORC][Character.male][5] = {nameDe="langer Pferdeschwanz", nameEn="long ponytail"}
        M.hairStyles[globalvar.raceORC][Character.female] = {}
            M.hairStyles[globalvar.raceORC][Character.female][0] = {nameDe="Glatze", nameEn="bald head"}
            M.hairStyles[globalvar.raceORC][Character.female][1] = {nameDe="kurze Haare", nameEn="short hair"}
            M.hairStyles[globalvar.raceORC][Character.female][4] = {nameDe="hochgesteckte Haare", nameEn="pinned up hair"}
            M.hairStyles[globalvar.raceORC][Character.female][7] = {nameDe="lange, offene Haare", nameEn="long open hair"}


--Beard styles
M.beardStyles = {}
--beardStyles[race ID][beard ID]

    M.beardStyles[globalvar.raceHUMAN] = {}
        M.beardStyles[globalvar.raceHUMAN][0] = {nameDe="kein Bart", nameEn="no beard"}
        M.beardStyles[globalvar.raceHUMAN][1] = {nameDe="Backenbart", nameEn="short beard"}
        M.beardStyles[globalvar.raceHUMAN][3] = {nameDe="Spitzbart", nameEn="Goatee Beard"}
        M.beardStyles[globalvar.raceHUMAN][4] = {nameDe="Bauschebart", nameEn="Square Beard"}
        M.beardStyles[globalvar.raceHUMAN][5] = {nameDe="Lincolnbart", nameEn="thin beard"}
        M.beardStyles[globalvar.raceHUMAN][6] = {nameDe="Vollbart", nameEn="long beard"}
        M.beardStyles[globalvar.raceHUMAN][8] = {nameDe="Kapitainsbart", nameEn="Mutton Chops"}

    M.beardStyles[globalvar.raceDWARF] = {}
        M.beardStyles[globalvar.raceDWARF][0] = {nameDe="kein Bart", nameEn="no beard"}
        M.beardStyles[globalvar.raceDWARF][1] = {nameDe="Backenbart", nameEn="short beard"}
        M.beardStyles[globalvar.raceDWARF][2] = {nameDe="Vollbart", nameEn="long beard"}
        M.beardStyles[globalvar.raceDWARF][4] = {nameDe="Rauschebart", nameEn="long thick beard"}

--basic hair colors
M.hairColorSimple = {
    {r=255 ,g=250 ,b=205 ,nameDe="weißblond", nameEn="white blonde"},
    {r=255 ,g=215 ,b=0 ,nameDe="blond", nameEn="blonde"},
    {r=205 ,g=173 ,b=0 ,nameDe="dunkelblond", nameEn="dark blonde"},
    {r=139 ,g=129 ,b=76 ,nameDe="hellbraun", nameEn="light brown"},
    {r=139 ,g=69 ,b=19 ,nameDe="braun", nameEn="brown"},
    {r=60 ,g=22 ,b=21 ,nameDe="dunkelbraun", nameEn="dark brown"},
    {r=0 ,g=0 ,b=0 ,nameDe="schwarz", nameEn="black"},
    {r=255 ,g=127 ,b=36 ,nameDe="hellrot", nameEn="light ginger"},
    {r=205 ,g=51 ,b=51 ,nameDe="dunkelrot", nameEn="dark ginger"}
}

return M
