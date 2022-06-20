-- name: CreateReleaseAssignment :one
INSERT INTO t1.user_tasks (
    created_at,
    created_by,
    updated_at,
    updated_by,
    priority,
    user_id
) VALUES (
    now() AT TIME ZONE 'utc', -- created_at
    @created_by,
    now() AT TIME ZONE 'utc', -- updated_at
    @created_by, -- updated_by
    @priority,
    @user_id
) RETURNING *;

-- name: FindReleaseAssignment :one
SELECT * FROM t1.user_tasks WHERE id = $1 LIMIT 1;

-- name: UpdateReleaseAssignment :one
UPDATE t1.user_tasks SET
    created_at = created_at,
    created_by = created_by,
    updated_at = now() AT TIME ZONE 'utc',
    updated_by = @updated_by,
    priority = @priority,
    user_id = @user_id
WHERE id = $1 RETURNING *;

-- name: DeleteReleaseAssignment :execrows
DELETE FROM t1.user_tasks WHERE id = $1;
