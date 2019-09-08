QuestLogFrame:HookScript('OnUpdate', function(self)
	local numEntries, numQuests = GetNumQuestLogEntries();
	
	if (numEntries == 0) then return end
	
	local questIndex, questLogTitle, title, level, _, isHeader
	for i = 1, QUESTS_DISPLAYED, 1 do
		questIndex = i + FauxScrollFrame_GetOffset(QuestLogListScrollFrame);
		
		if (questIndex <= numEntries) then
			questLogTitle = _G["QuestLogTitle"..i];
			title, level, _, isHeader = GetQuestLogTitle(questIndex)
			
			if (not isHeader) then
				questLogTitle:SetText(format("[%d] %s", level, title))
			end
		end
	end
end)