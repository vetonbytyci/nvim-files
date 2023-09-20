local status, git_conflict = pcall(require, "git_conflict")
if not status then
	return
end

git_conflict.setup({})
