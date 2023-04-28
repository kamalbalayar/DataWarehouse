/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [card_name]
      ,[type]
      ,[class]
      ,[race]
      ,[cardset]
      ,[rarity]
      ,[cost]
      ,[attack]
      ,[health]
      ,[durability]
      ,[craft_cost]
      ,[disenchant_cost]
      ,[artist]
      ,[card_text]
      ,[back_text]
      ,[lore]
      ,[format]
      ,[school]
  FROM [Hearth].[dbo].[card_meta]

  SELECT TOP (1000) [card_name]
      ,[type]
      ,[class]
      ,[race]
      ,[cardset]
      ,[rarity]
      ,[cost]
      ,[attack]
      ,[health]
      ,[durability]
      ,[craft_cost]
      ,[disenchant_cost]
      ,[artist]
      ,[card_text]
      ,[back_text]
      ,[lore]
      ,[format]
      ,[school]
  FROM [Hearth].[dbo].[card_meta]
  where rarity = 'legendary'

  /**  2.show names and cost of all legendary minions whose cost is 9 or 10**/
  select card_name, cost
  from [Hearth].[dbo].[card_meta]
  where cost =9 or cost =10

  /** 3. Show names and card_texts of all Dragons that have Battlecry ability
**/
select card_meta.card_name, card_text
from [card_meta],[card_abilities]
where [card_meta].[card_name]=[card_abilities].[card_name]
AND race='abilitie' And race ='Battlecry'




/**
4.**/
select *
from [Hearth].[dbo].[card_meta], [card_abilities]
where card_abilities.card_name=card_meta.card_name
and type = 'spell'
and  class = 'Mege'
and ability = 'Deal damage'
order by health desc


/**5. Show name, attack, health and cost of the deathrattle card with the highest health
 **/
select [Hearth].[dbo].[card_meta].card_name, attack, health
from [Hearth].[dbo].[card_meta], [card_abilities]
where card_abilities.card_name=card_meta.card_name
AND ability like '%Deathrattle'
and Attack =12
order by health desc

/** 6. Show the name of illustrator who drew images for more than 100 cards

**/
select artist
from [Hearth].[dbo].[card_meta]
group by artist

select artist, count(*) as numberof_card
from [Hearth].[dbo].[card_meta]
group by artist
having count(*)>100
order by count(*) desc


/** 7. Show the top 10 cardsets that Blizzard recruited the highest number of artists to draw card illustrations.
(Blizzard introduces a number of new cards every 4-5months, and call it a cardset)
 **/
 select top 10 cardset, count(distinct Artist) as numartist
 from card_meta 
 group by cardset

 order by numartist desc

 /** 8. (very difficult) Show names of Area of effect (AOE) spells that both deal damage and restore health
How do you show their card texts?
**/
select *
  from [Hearth].[dbo].[card_meta], card_abilities

  select card_text, ability
  from card_meta, card_abilities
  where 


/** 9. What are the popular Battlecry cards actually played by each user? **/

select
order by 